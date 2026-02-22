import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:psc_app/controller/cee_controller/cee_disscussion_controller.dart';
import 'package:psc_app/data/repository/cee_repository/cee_discussion_repo.dart';
import 'package:psc_app/data/services/cee_services/cee_firebase_services.dart';

class CeeDiscussionScreen extends StatelessWidget {
  final String roomId;
  final String currentUserId;

  CeeDiscussionScreen({required this.roomId, required this.currentUserId});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(
      CeeDisscussionController(
        repository: CeeDiscussionRepo(CeeFirebaseServices()),
        roomId: roomId,
      ),
    );

    return Scaffold(
      appBar: AppBar(title: Text("Discussion")),
      body: Column(
        children: [
          Expanded(
            child: Obx(
              () => ListView.builder(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                controller: controller.scrollController,
                reverse: true,
                itemCount: controller.messages.length,
                itemBuilder: (context, index) {
                  final msg = controller.messages[index];
                  final isMe = msg.senderId == currentUserId;
                  return Align(
                    alignment: isMe
                        ? Alignment.centerRight
                        : Alignment.centerLeft,
                    child: Container(
                      margin: EdgeInsets.all(6),
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: isMe ? Colors.blue : Colors.grey[300],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: msg.imageUrl != null && msg.imageUrl!.isNotEmpty
                          ? Image.network(msg.imageUrl!, width: 200)
                          : Text(
                              msg.text,
                              style: TextStyle(
                                color: isMe ? Colors.white : Colors.black,
                              ),
                            ),
                    ),
                  );
                },
              ),
            ),
          ),
          Row(
            children: [
              Expanded(
                child: Container(
                  padding: EdgeInsets.only(left: 15),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: controller.textController,
                          minLines: 1,
                          maxLines: 6,
                          keyboardType: TextInputType.multiline,
                          textInputAction: TextInputAction.newline,

                          decoration: InputDecoration(
                            hintText: "Ask your queries",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                        ),
                      ),
                      
                    ],
                  ),
                ),
              ),
              IconButton(
                icon: Icon(Icons.send, color: Colors.blue),
                onPressed: () => controller.sendTextMessage(currentUserId),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
