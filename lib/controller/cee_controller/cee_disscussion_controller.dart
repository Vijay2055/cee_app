import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:psc_app/data/repository/cee_repository/cee_discussion_repo.dart';
import 'package:psc_app/model/cee_model/disscution_model.dart';

class CeeDisscussionController extends GetxController {
  final CeeDiscussionRepo repository;
  final String roomId;

  CeeDisscussionController({required this.repository, required this.roomId});

  var messages = <DisscutionModel>[].obs;
  final isLoading = false.obs;
  final isLoadingMore = false.obs;
  final scrollController = ScrollController();

  DocumentSnapshot? lastDoc;
  DateTime? latestCreatedAt;

  TextEditingController textController = TextEditingController();

  Future<void> loadMessages() async {
    if (isLoading.value) return;
    isLoading.value = true;
    try {
      final result = await repository.getMessages(roomId, startAfter: lastDoc);

      if (result.isNotEmpty) {
        lastDoc = result.last.snapshot;

        final newest = result.first;

        if (latestCreatedAt == null ||
            newest.model.createdAt.isAfter(latestCreatedAt!)) {
          latestCreatedAt = newest.model.createdAt;
        }

        final newMsgs = result.map((e) => e.model).toList();
        messages.addAll(newMsgs);
        // messages.addAll(result);
        // lastDoc = result.last as DocumentSnapshot<Object?>?; // Avoid duplicates
        // final newMsgs = result
        //     .where((m) => !messages.any((msg) => msg.id == m.id))
        //     .toList();

        // messages.addAll(newMsgs); // append older messages at bottom
        // // lastDoc = result.last.firestoreDoc; // track last document for next page
      }
    } catch (e) {
      Get.snackbar("Error", "Failed to load Data due to $e");
      print(e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> sendTextMessage(String senderId) async {
    if (textController.text.trim().isEmpty) return;
    try {
      await repository.sentTextMessage(
        roomId,
        textController.text.trim(),
        senderId,
      );
      textController.clear();
    } catch (e) {
      Get.snackbar("Error", "Can't send message due to $e");
      print(e.toString());
    }
  }

  Future<void> sendImageMsg(String senderId, String path) async {
    try {
      final url = await repository.uploadImage(roomId, path);
      await repository.sendImageMessage(roomId, url, senderId);
    } catch (e) {
      Get.snackbar("Error", "Can't send image message due to $e");
    }
  }

  /// Listen to new messages in realtime
  void _listenToMessages() {
    repository.listenMessage(roomId).listen((newMessages) {
      messages.assignAll(newMessages);
    });
  }

  @override
  void onInit() {
    // TODO: implement onInit
    _listenToMessages();

    // scrollController.addListener(() {
    //   if (scrollController.position.pixels ==
    //       scrollController.position.maxScrollExtent) {
    //     loadMessages();
    //   }
    // });

    super.onInit();
  }
}
