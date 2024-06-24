import 'package:assignment/global/button.dart';
import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' as foundation;
import 'package:image_picker/image_picker.dart';

class emoji extends StatefulWidget {
  const emoji({super.key});

  @override
  State<emoji> createState() => _emojiState();
}

class _emojiState extends State<emoji> {
  final _controller = TextEditingController();
  final _scrollController = ScrollController();
  bool _emojiShowing = false;
  final ImagePicker _picker = ImagePicker();
  XFile? _image;

  Future getImage() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);

    setState(() {
      _image = image;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text('Emoji Picker Example App'),
        ),
        body: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: Center(
                  child: ValueListenableBuilder(
                    valueListenable: _controller,
                    builder: (context, text, child) {
                      return Text(
                        _controller.text,
                      );
                    },
                  ),
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: TextField(
                        controller: _controller,
                        scrollController: _scrollController,
                        style: const TextStyle(
                          fontSize: 20.0,
                          color: Colors.black87,
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
                              setState(() {
                                _emojiShowing = !_emojiShowing;
                              });
                            },
                          ),
                          hintText: 'Enter Message',
                          filled: true,
                          fillColor: Colors.white,
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
                              getImage();
                            },
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 12,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: kPrimaryColor,
                        borderRadius: BorderRadius.all(Radius.circular(12))),
                    height: 50,
                    child: IconButton(
                        onPressed: () {
                          // send message
                        },
                        icon: const Icon(
                          Icons.send,
                          color: kBackgroundColor,
                        )),
                  )
                ],
              ),
              Offstage(
                offstage: !_emojiShowing,
                child: EmojiPicker(
                  textEditingController: _controller,
                  scrollController: _scrollController,
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
