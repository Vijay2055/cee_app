import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:psc_app/controller/cee_controller/notes_controller.dart';
import 'package:psc_app/model/cee_model/cee_custominfo_model.dart';
import 'package:psc_app/screens/cee_screens/past_year_question_screen.dart';
import 'package:psc_app/screens/cee_screens/subindex_screen.dart';
import 'package:psc_app/screens/show_pdf_screen.dart';
import 'package:psc_app/widgets/cee_widgets/cee_custom_card.dart';
import 'package:psc_app/widgets/cee_widgets/cee_custom_list_tiles.dart';
import 'package:psc_app/widgets/cee_widgets/quote_banner.dart';

class CeeDetailScreens extends StatelessWidget {
  const CeeDetailScreens({super.key});
  @override
  Widget build(BuildContext context) {
    final notesController = Get.put(NotesController());
   
    return 
    
    Column(
      children: [
        QuoteBanner(),
        SizedBox(height: 10),
        Container(
          height: 250,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: const Color.fromARGB(36, 128, 207, 231),
          ),

          child: GridView.count(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),

            padding: EdgeInsets.all(10),
            crossAxisCount: 3,
            mainAxisSpacing: 10,
            crossAxisSpacing: 6,
            childAspectRatio: 1, 
            children: listOfSubject
                .map(
                  (item) => CeeCustomCard(
                    onTypeSelect: () {
                      if (item.subjectType == "syllabus") {
                        Get.to(
                          ShowPdfScreen(
                            pdfUrl:
                                "https://firebasestorage.googleapis.com/v0/b/sambhi-online-study.firebasestorage.app/o/pdfs%2F1755745597351_2024-07-28_Curriculum%201st%20year%20all%20subject%20(1)%20(1).pdf?alt=media&token=b8838a45-b00b-48dc-8129-2e998642722e",
                            title: "Syllabus",
                          ),
                        );
                      } else {
                       
                        Get.to(SubindexScreen(),arguments: item.subjectType);
                      }
                    },
                    color: item.color,
                    title: item.title,
                    icon: item.icon,
                  ),
                )
                .toList(),
          ),
        ),

        OutlinedButton(
          onPressed: () {
            notesController.loadPastYearPaper();
            Get.to(() => PastYearQuestionScreen());
          },
          child: Text("Past year Question Paper"),
        ),

        SizedBox(height: 20),

        Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              "Latest",
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),

        Container(
          height: 300,
          child: ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            itemCount: 3,
            itemBuilder: (ctx, index) {
              return CeeCustomListTiles(
                title: "Heat and wave",
                description: "20 questions",
                onTap: () {},
              );
            },
          ),
        ),

        Align(
          alignment: Alignment.topRight,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: TextButton(onPressed: () {}, child: Text("View more..")),
          ),
        ),
      ],
    );
  }
}
