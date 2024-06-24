import 'dart:io';

import 'package:assignment/ApiService/rest_service.dart';
import 'package:assignment/global/button.dart';
import 'package:assignment/main.dart';
import 'package:assignment/model/chat_model.dart';
import 'package:date_utility/date_utility.dart';
import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart' as foundation;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

class ChatScreen extends StatelessWidget {
  ChatScreen({super.key});

  final ChatController chatController = Get.put(ChatController());

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Group chat",
              style: GoogleFonts.cherrySwash(
                fontWeight: FontWeight.w700,
                color: kBackgroundColor,
                fontSize: 28,
              ),
            ),
            Text(
              name,
              style: GoogleFonts.exo(
                fontWeight: FontWeight.w400,
                color: kBackgroundColor,
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Obx(() {
                return ListView.builder(
                  controller: chatController.scrollController,
                  reverse: true,
                  itemCount: chatController.chatModelList.length,
                  itemBuilder: (context, index) {
                    final chatData = chatController.chatModelList[index];
                    final userDetails = chatData.userDetails;
                    final chatDetails = chatData.chatDetails;

                    if (userDetails == null ||
                        userDetails.isEmpty ||
                        chatDetails == null) {
                      return Container();
                    }

                    return userId == userDetails[0].id
                        ? MyMsg(data: chatData)
                        : OtherMsg(data: chatData);
                  },
                );
              }),
            ),
            Divider(
              color: kPrimaryColor,
              height: 4,
            ),
            const SizedBox(
              height: 17,
            ),
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: TextField(
                      controller: chatController.textController,
                      scrollController: chatController.scrollController,
                      style: TextStyle(
                        fontSize: 20.0,
                        color: kPrimaryColor,
                      ),
                      maxLines: 1,
                      decoration: InputDecoration(
                        focusColor: kChat,
                        prefixIcon: IconButton(
                          icon:  Icon(
                            CupertinoIcons.smiley,
                            color: kPrimaryColor,
                          ),
                          onPressed: () {
                            chatController.toggleEmojiShowing();
                          },
                        ),
                        hintText: 'Enter Message',
                        hintStyle: TextStyle(
                            color: kPrimaryColor, fontWeight: FontWeight.w400),
                        filled: true,
                        fillColor: kChat,
                        contentPadding: const EdgeInsets.only(
                          left: 16.0,
                          bottom: 8.0,
                          top: 8.0,
                          right: 16.0,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        suffixIcon: IconButton(
                          icon:  Icon(
                            Icons.image_outlined,
                            color: kPrimaryColor,
                          ),
                          onPressed: () {
                            chatController.getImage();
                          },
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 12,
                ),
                Container(
                  decoration: BoxDecoration(
                      color: kPrimaryColor,
                      borderRadius:
                          const BorderRadius.all(Radius.circular(12))),
                  height: 50,
                  child: IconButton(
                      onPressed: () {
                        chatController.sendChat();
                      },
                      icon: const Icon(
                        Icons.send,
                        color: kBackgroundColor,
                      )),
                )
              ],
            ),
            Obx(() {
              return Offstage(
                offstage: !chatController.emojiShowing.value,
                child: EmojiPicker(
                  textEditingController: chatController.textController,
                  scrollController: chatController.scrollController,
                  config: Config(
                    height: 256,
                    checkPlatformCompatibility: true,
                    emojiViewConfig: EmojiViewConfig(
                      emojiSizeMax: 28 *
                          (foundation.defaultTargetPlatform ==
                                  TargetPlatform.iOS
                              ? 1.2
                              : 1.0),
                    ),
                    swapCategoryAndBottomBar: false,
                    skinToneConfig: const SkinToneConfig(),
                    categoryViewConfig: const CategoryViewConfig(),
                    bottomActionBarConfig: const BottomActionBarConfig(),
                    searchViewConfig: const SearchViewConfig(),
                  ),
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}

class ChatController extends GetxController {
  RestService restService = RestService();
  ScrollController scrollController = ScrollController();
  RxList<Data> chatModelList = <Data>[].obs;
  TextEditingController textController = TextEditingController();
  RxBool emojiShowing = false.obs;
  File? image;

  @override
  void onInit() {
    super.onInit();
    getAllChat();
  }

  Future<void> getImage() async {
    final pickedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      image = File(pickedImage.path);
      print('file ${pickedImage.path}');
      sendChat();
    }
  }

  Future<void> getAllChat() async {
    var res = await restService.getAllChat();
    if (res.data != null) {
      chatModelList.assignAll(res.data!.reversed.toList());
    }
  }

  Future<void> sendChat() async {
    if (textController.text.isEmpty) {
      return;
    }
    var res = await restService.sendChat(
      userId: userId.toString(),
      message: textController.text,
      file: image,
    );
    if (res.message != "true") {
      textController.clear();
      getAllChat();
    }
  }

  void toggleEmojiShowing() {
    emojiShowing.value = !emojiShowing.value;
  }
}

class OtherMsg extends StatelessWidget {
  final Data data;

  const OtherMsg({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    final userDetails = data.userDetails;
    final chatDetails = data.chatDetails;

    if (userDetails == null || userDetails.isEmpty || chatDetails == null) {
      return Container();
    }

    return chatDetails.message == null || chatDetails.message!.isEmpty
        ? const SizedBox.shrink()
        : Padding(
      padding: EdgeInsets.symmetric(vertical: height * 0.01),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: width * 0.8,
                  child: Row(
                    children: [
                      Text(
                        userDetails[0].name ?? 'Unknown',
                        style: GoogleFonts.exo(
                            fontWeight: FontWeight.w600,
                            fontSize: 14,
                            color: kPrimaryColor),
                      ),
                      const Spacer(),
                      Text(
                        DateUtility().changeDateFormat(
                          chatDetails.createdAt!,
                          "h:mm a",
                        ),
                        style: GoogleFonts.exo(
                            fontSize: 12, fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: width * 0.8,
                  decoration: const BoxDecoration(
                      color: kChat,
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(16),
                          bottomLeft: Radius.circular(16),
                          bottomRight: Radius.circular(16))),
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 10, horizontal: 14),
                    child: Text(
                      chatDetails.message ?? '',
                      style: const TextStyle(
                          fontWeight: FontWeight.w400, fontSize: 14),
                    ),
                  ),
                ),
              ],
            ),
        );
  }
}

class MyMsg extends StatelessWidget {
  final Data data;

  const MyMsg({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    final userDetails = data.userDetails;
    final chatDetails = data.chatDetails;

    if (userDetails == null || userDetails.isEmpty || chatDetails == null) {
      return Container();
    }

    return chatDetails.message == null || chatDetails.message!.isEmpty
        ? const SizedBox.shrink()
        :  Padding(
      padding: EdgeInsets.symmetric(vertical: height * 0.01),
          child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
          SizedBox(
            width: width * 0.8,
            child: Row(
              children: [
                Text(userDetails[0].name ?? 'Unknown'),
                Spacer(),
                Text(DateUtility()
                    .changeDateFormat(chatDetails.createdAt!, "h:mm a")),
              ],
            ),
          ),
          Container(
            width: width * 0.8,
            decoration: const BoxDecoration(
                color: kChat,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16),
                    bottomLeft: Radius.circular(16),
                    bottomRight: Radius.circular(16))),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 14),
              child: Text(
                chatDetails.message ?? '',
                style: const TextStyle(fontWeight: FontWeight.w400, fontSize: 14),
              ),
            ),
          ),
                ],
              ),
        );
  }
}
