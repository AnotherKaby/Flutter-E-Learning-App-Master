import 'package:flutter/material.dart';
import 'package:flutter_e_learning_app_master/app/data/models/user_model.dart';
import 'package:flutter_e_learning_app_master/app/modules/dashboard/page/Discus/controllers/discuss_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_e_learning_app_master/app/data/models/chat_model.dart';
import 'package:flutter_e_learning_app_master/app/data/utils/color_pallete.dart';
import 'package:flutter_e_learning_app_master/app/widget/chat_bubble.dart';
import 'package:flutter_e_learning_app_master/app/widget/snackbar_widget.dart';
import '../../../../../widget/chat_shimmer.dart';

class DiscussView extends GetView<DiscussController> {
  const DiscussView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPallete.bgColorWhite,
      appBar: AppBar(
        backgroundColor: ColorPallete.bgColor,
        title: Text(
          'Diskusi Soal',
          style:
              GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.w700),
        ),
        centerTitle: true,
      ),
      body: RefreshIndicator(
        onRefresh: () => controller.refreshData(),
        child: GetBuilder<DiscussController>(builder: (controller) {
          return StreamBuilder(
            stream: controller
                .getCollection()
                .orderBy('message', descending: true)
                .snapshots(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting ||
                  controller.isLoading) {
                return ListView.builder(
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return chatShimmer();
                    });
              }
              if (!snapshot.hasData) {
                ErrorSnack.show(message: "Saat ini tidak ada diskusi tersedia");
                return const Center(
                  child: Text('Tidak ada chat tersedia'),
                );
              }

              if (snapshot.hasError) {
                ErrorSnack.show(message: "Gagal mendapatkan data chat !!!");
                return const Center();
              }
              return ListView.builder(
                itemCount: snapshot.data!.docs.reversed.length,
                itemBuilder: (context, index) {
                  Message chat =
                      Message.fromFirestore(snapshot.data!.docs[index]);
                  if (chat.email == controller.userData.data!.userEmail!) {
                    return Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 20, vertical: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          ChatBubble(
                            colorp: const Color(0xff3A7FD5),
                            name: chat.name,
                            message: chat.message,
                            sendAt: chat.sendAt,
                            isSender: true,
                          )
                        ],
                      ),
                    );
                  } else {
                    return Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 20, vertical: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ChatBubble(
                              colorp: const Color(0xffE0F8FF),
                              name: chat.name,
                              message: chat.message,
                              sendAt: chat.sendAt)
                        ],
                      ),
                    );
                  }
                },
              );
            },
          );
        }),
      ),
      bottomNavigationBar: Container(
        height: 65,
        width: ScreenUtil().screenWidth,
        color: Colors.white,
        padding: EdgeInsets.fromLTRB(5,10,5,10),
        child: Row(
          children: [
            IconButton(
              color: const Color(0xffF6F6F6),
              onPressed: controller.openGallery,
              icon: const Icon(
                Icons.add,
                color: ColorPallete.bgColor,
              ),
            ),
            Expanded(
              child: TextField(
                controller: controller.messageController,
                decoration: InputDecoration(
                  suffixIcon: GestureDetector(
                    onTap: controller.openGallery,
                    child: const Icon(
                      Icons.camera_alt,
                      color: ColorPallete.bgColor,
                    ),
                  ),
                  hintText: 'Type your message...',
                  filled: true,
                  fillColor: ColorPallete.bgColorForm,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),
            SizedBox(width: 10),
            InkWell(
              onTap: () {
                if (controller.messageController.text.isNotEmpty) {
                  controller.sendMessage(controller.messageController.text);
                  controller.messageController.clear();
                }
              },
              child: Container(
                height: 35,
                width: 35,
                child: const Icon(
                  Icons.send,
                  color: ColorPallete.bgColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
