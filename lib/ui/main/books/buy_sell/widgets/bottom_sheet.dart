import 'package:bookhubuz/core/custom_widgets/custom_button/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FilterBottomSheet extends StatefulWidget {
  const FilterBottomSheet({
    Key? key,
  }) : super(key: key);

  @override
  State<FilterBottomSheet> createState() => _FilterBottomSheetState();
}

class _FilterBottomSheetState extends State<FilterBottomSheet> {
  bool _value = false;
  int val = -1;
  RangeValues _currentRangeValues = const RangeValues(1, 100);
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        showModalBottomSheet(
            context: context,
            builder: (BuildContext c) {
              return StatefulBuilder(
                builder: (BuildContext context,
                    void Function(void Function()) setState) {
                  return Container(
                    height: MediaQuery.of(context).size.height * 0.7,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                    ),
                    child: Padding(
                      padding:
                          const EdgeInsets.only(left: 15, right: 15, top: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Sort'),
                              Text('this is for dropdown')
                            ],
                          ),
                          const Divider(),
                          const Text('Category'),
                          SizedBox(
                            height: 43,
                            child: ListView.separated(
                              scrollDirection: Axis.horizontal,
                              physics: const BouncingScrollPhysics(),
                              separatorBuilder: (context, index) =>
                                  const SizedBox(
                                width: 10,
                              ),
                              itemCount: 7,
                              // physics: const NeverScrollableScrollPhysics(),
                              // primary: false,
                              itemBuilder: (context, index) {
                                return Container(
                                  height: 32,
                                  width: 84,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Colors.white,
                                    border: Border.all(color: Colors.blue),
                                  ),
                                  child: const Center(
                                      child: Text(
                                    'language',
                                    style: TextStyle(
                                        color: Colors.black87, fontSize: 12),
                                  )),
                                );
                              },
                            ),
                          ),
                          const Divider(),
                          const Text('Price'),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Container(
                                  height: 40,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Color(0xffF9F9FD),
                                  ),
                                  child: Center(
                                    child: Text('price 1'),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 10),
                              Expanded(
                                child: Container(
                                  height: 40,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Color(0xffF9F9FD),
                                  ),
                                  child: Center(
                                    child: Text('price 2'),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SliderTheme(
                            data: SliderThemeData(
                                showValueIndicator: ShowValueIndicator.always),
                            child: RangeSlider(
                              values: _currentRangeValues,
                              min: 0,
                              max: 1000,
                              labels: RangeLabels(
                                  '${_currentRangeValues.start.round()}',
                                  '${_currentRangeValues.end.round()}'),
                              inactiveColor: Colors.grey,
                              activeColor: Colors.black,
                              onChanged: (RangeValues values) {
                                print("hello");
                                setState(() {
                                  _currentRangeValues = values;
                                });
                              },
                            ),
                          ),
                          const Divider(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Text('Rating'),
                              Text('THis is for dropdown'),
                            ],
                          ),
                          Center(
                            child: CustomButton(
                              width: MediaQuery.of(context).size.width * 0.3,
                              onTap: () {},
                              child: Text(
                                'Done',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            });
        // Get.bottomSheet(

        //   isScrollControlled: true,
        //   enableDrag: true,
        // );
      },
      icon: const Icon(Icons.sort),
    );
  }
}
