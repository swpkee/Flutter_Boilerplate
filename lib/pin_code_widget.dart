import 'package:flutter/material.dart';

class PinCodeWidget extends StatefulWidget {
  const PinCodeWidget({super.key});

  @override
  State<PinCodeWidget> createState() => _PinCodeWidgetState();
}

class _PinCodeWidgetState extends State<PinCodeWidget> {
  String enteredPin = '';

  Widget numButton(int number) {
    return Padding(
      padding: const EdgeInsets.only(top: 16),
      child: TextButton(
          onPressed: () {
            setState(() {
              if (enteredPin.length < 4) {
                enteredPin += number.toString();
              }
            });
          },
          child: Center(
            child: Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.all(6.0),
              width: 52,
              height: 52,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: Colors.white,
                  border: Border.all(
                    color: const Color.fromARGB(255, 135, 135, 135),
                  )),
              child: Text(
                number.toString(),
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
            ),
          )),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          physics: const BouncingScrollPhysics(),
          children: [
            Center(
              child: Container(
                margin: const EdgeInsets.only(top: 10),
                child: const Text(
                  'ตั้งค่า Pin Code',
                  style: TextStyle(
                    fontSize: 18,
                    color: Color.fromARGB(255, 135, 135, 135),
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 80),
            const Center(
              child: Text(
                'ระบุ Pin Code ที่ต้องการ',
                style: TextStyle(
                  fontSize: 18,
                  color: Color.fromARGB(255, 135, 135, 135),
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            const SizedBox(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                6,
                (index) {
                  return Container(
                    margin: const EdgeInsets.all(6.0),
                    width: 18,
                    height: 18,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: index < enteredPin.length
                            ? const Color.fromARGB(255, 135, 135, 135)
                            : Colors.white,
                        border: Border.all(
                          color: const Color.fromARGB(255, 135, 135, 135),
                        )),
                  );
                },
              ),
            ),
            const SizedBox(height: 30),
            for (var i = 0; i < 3; i++)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: List.generate(
                    3,
                    (index) => numButton(1 + 3 * i + index),
                  ).toList(),
                ),
              ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 42),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const TextButton(onPressed: null, child: SizedBox()),
                  numButton(0),
                  TextButton(
                    onPressed: () {
                      setState(
                        () {
                          if (enteredPin.isNotEmpty) {
                            enteredPin =
                                enteredPin.substring(0, enteredPin.length - 1);
                          }
                        },
                      );
                    },
                    child: Container(
                      margin: const EdgeInsets.fromLTRB(6, 20, 10, 6),
                      width: 28,
                      height: 28,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(7),
                        color: const Color.fromARGB(255, 135, 135, 135),
                      ),
                      child: const Text(
                        'X',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
