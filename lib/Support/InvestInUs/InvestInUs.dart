import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:flutter/material.dart';
import 'package:my_app/Footer/Footer.dart';
import 'package:my_app/Projects/EagleDel-1/ProjectSpending/ProjectBudget.dart';
import 'package:my_app/Utils/MyTextFormField.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import '../../Header/MyAppBarPage.dart';

enum InvestPackages {
  free,
  fullEagle,
}

class InvestInUsPage extends StatefulWidget {
  const InvestInUsPage({Key? key}) : super(key: key);

  @override
  State<InvestInUsPage> createState() => _InvestInUsPageState();
}

class _InvestInUsPageState extends State<InvestInUsPage> {
  InvestPackages _investPackages = InvestPackages.free;

  double customInvestMoney = 0.0;

  int _index = 0;

  String selectedStates = "Select the state";

  List<String> _states = [
    "Select the state",
    "AL",
    "AK",
    "AZ",
    "AR",
    "CA",
    "CO",
    "CT",
    "DE",
    "FL",
    "GA",
    "HI",
    "ID",
    "IL",
    "IN",
    "IA",
    "KS",
    "KY",
    "LA",
    "ME",
    "MD",
    "MA",
    "MI",
    "MN",
    "MS",
    "MO",
    "MT",
    "NE",
    "NV",
    "NH",
    "NJ",
    "NM",
    "NY",
    "NC",
    "ND",
    "OH",
    "OK",
    "OR",
    "PA",
    "RI",
    "SC",
    "SD",
    "TN",
    "TX",
    "UT",
    "VT",
    "VA",
    "WA",
    "WV",
    "WI",
    "WY"
  ];

  final EagleDelProjectBudget = ProjectBudget(1132.0, 0.0);

  
  // Creating a list of tabs
  List<Tab> tabs = <Tab>[
    Tab(
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: const [
            Icon(
              Icons.credit_card,
              size: 24.0,
            ),
            Text(
              "Card",
              style: TextStyle(fontSize: 24.0),
            ),
          ]),
    ),
    Tab(
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: const [
            Icon(
              Icons.account_balance,
              size: 24.0,
            ),
            Text(
              "ACH",
              style: TextStyle(fontSize: 24.0),
            ),
          ]),
    ),
  ];

  // Creating the tab states
  int _tabsState = 0;

  // Variables for Card Payment
  String cardHolderName = "";
  String cardNumber = "";
  String expiredDate = "";
  String cvc = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        leadingWidget: null,
      ),
      body: ListView(
        children: [
          const SizedBox(
            height: 16.0,
          ),
          Align(
            alignment: Alignment.center,
            child: Text(
              "Invest In Us",
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          const SizedBox(
            height: 16.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Investment Process
              Expanded(
                flex: 3,
                child: SizedBox(
                  height: 600.0,
                  child: Card(
                    child: Stepper(
                      currentStep: _index,
                      controlsBuilder: ((context, details) {
                        return Row(
                          children: [
                            ElevatedButton(
                              child: (_index == 0)
                                  ? Text("Continue")
                                  : Text("Submit"),
                              onPressed: (_index == 0 &&
                                          customInvestMoney != 0 &&
                                          _investPackages ==
                                              InvestPackages.free ||
                                      _index == 0 &&
                                          customInvestMoney != 0 &&
                                          _investPackages ==
                                              InvestPackages.fullEagle &&
                                          selectedStates != _states.first ||
                                      _index == 1 &&
                                          _tabsState == 0 &&
                                          cardHolderName != "" &&
                                          cardNumber != "" &&
                                          expiredDate != "" &&
                                          cvc != "" ||
                                      _index == 1 && _tabsState == 1 ||
                                      _index == 2)
                                  ? () {
                                      if (_index == 2) {
                                        debugPrint("Submit the investment");
                                      } else {
                                        setState(() {
                                          _index += 1;
                                        });
                                      }
                                    }
                                  : null,
                            ),

                            const SizedBox(
                              width: 16.0,
                            ),

                            // The Cancel button for the stepper
                            (_index == 1 || _index == 2)
                                ? TextButton(
                                    onPressed: () {
                                      if (_index >= 1) {
                                        setState(() {
                                          _index -= 1;
                                        });
                                      }
                                    },
                                    child: const Text("Cancel"),
                                  )
                                : Container(),
                          ],
                        );
                      }),
                      steps: [
                        // Select Investment Amount Steps
                        Step(
                            title: const Text("Select Invest Amount"),
                            content: SizedBox(
                              height: 400.0,
                              child: ListView(
                                children: [
                                  // Invest Packages For Free
                                  SizedBox(
                                    height:
                                        (_investPackages == InvestPackages.free)
                                            ? 100.0
                                            : 50.0,
                                    child: Card(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Radio<InvestPackages>(
                                                  value: InvestPackages.free,
                                                  groupValue: _investPackages,
                                                  onChanged:
                                                      (InvestPackages? value) {
                                                    setState(() {
                                                      _investPackages = value!;
                                                      customInvestMoney = 0.0;
                                                    });
                                                  }),
                                              const SizedBox(
                                                width: 16.0,
                                              ),
                                              const Text(
                                                  "Invest Without Returns"),
                                            ],
                                          ),
                                          (_investPackages ==
                                                  InvestPackages.free)
                                              ? Padding(
                                                  padding:
                                                      const EdgeInsets.fromLTRB(
                                                          16.0, 0.0, 16.0, 8.0),
                                                  child: MyTextFormField(
                                                      initialValue: "0.0",
                                                      onChanged: (value) {
                                                        setState(() {
                                                          customInvestMoney =
                                                              double.parse(
                                                                  value);
                                                        });
                                                      },
                                                      textInputType:
                                                          const TextInputType
                                                                  .numberWithOptions(
                                                              decimal: true),
                                                      labelText:
                                                          "Invest amount",
                                                      obscuredText: false,
                                                      changeObscuredText: null,
                                                      prefixIcon: const Icon(
                                                          Icons.money)),
                                                )
                                              : Container(),
                                        ],
                                      ),
                                    ),
                                  ),

                                  // Invest Packages For FullEagle
                                  SizedBox(
                                    height: (_investPackages ==
                                            InvestPackages.fullEagle)
                                        ? 300.0
                                        : 200.0,
                                    child: Card(
                                      child: Column(
                                        children: [
                                          Row(
                                            children: [
                                              Radio(
                                                  value:
                                                      InvestPackages.fullEagle,
                                                  groupValue: _investPackages,
                                                  onChanged:
                                                      (InvestPackages? value) {
                                                    setState(() {
                                                      customInvestMoney = 800.0;
                                                      _investPackages = value!;
                                                    });
                                                  }),
                                              const SizedBox(
                                                width: 16.0,
                                              ),
                                              const Text("Invest \$800"),
                                            ],
                                          ),
                                          Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              RichText(
                                                text: TextSpan(
                                                  text:
                                                      "Fully Eagle First Gen \n",
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .bodyText1,
                                                  children: [
                                                    TextSpan(
                                                      text:
                                                          "Receives the EagleDel-1 with low cost \n",
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .bodyText2,
                                                    ),
                                                    TextSpan(
                                                      text:
                                                          "Flat rate domestic available",
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .bodyText2,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              RichText(
                                                text: TextSpan(
                                                  text: "ESTIMATED DELIVERY \n",
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .bodyText1,
                                                  children: [
                                                    TextSpan(
                                                      text: "Unknown \n\n",
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .bodyText2,
                                                    ),
                                                    TextSpan(
                                                      text: "Ships To \n",
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .bodyText1,
                                                    ),
                                                    TextSpan(
                                                      text: "Unknown",
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .bodyText2,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                          (_investPackages ==
                                                  InvestPackages.fullEagle)
                                              ? Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceEvenly,
                                                  children: [
                                                    // Shipping Destination Widget
                                                    Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        const Text(
                                                            "Shipping Destination"),
                                                        SizedBox(
                                                          width: 200.0,
                                                          child:
                                                              DropDownTextField(
                                                            enableSearch: true,
                                                            clearOption: false,
                                                            initialValue:
                                                                selectedStates,
                                                            onChanged: (value) {
                                                              setState(() {
                                                                selectedStates =
                                                                    value
                                                                        .toString();
                                                              });
                                                            },
                                                            dropDownList:
                                                                _states.map(
                                                                    (value) {
                                                              return DropDownValueModel(
                                                                  name: value,
                                                                  value: value);
                                                            }).toList(),
                                                          ),
                                                        ),
                                                      ],
                                                    ),

                                                    // Bonus Support
                                                    Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        SizedBox(
                                                          width: 200.0,
                                                          child:
                                                              MyTextFormField(
                                                                  initialValue:
                                                                      "0.0",
                                                                  onChanged:
                                                                      (value) {
                                                                    setState(
                                                                        () {
                                                                      customInvestMoney +=
                                                                          double.parse(
                                                                              value);
                                                                    });
                                                                  },
                                                                  textInputType:
                                                                      TextInputType
                                                                          .number,
                                                                  labelText:
                                                                      "Bonus Support (Optional)",
                                                                  obscuredText:
                                                                      false,
                                                                  changeObscuredText:
                                                                      null,
                                                                  prefixIcon:
                                                                      const Icon(
                                                                          Icons
                                                                              .money)),
                                                        )
                                                      ],
                                                    )
                                                  ],
                                                )
                                              : Container(),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )),

                        // Select Payment Options Steps
                        Step(
                          title: const Text("Payment"),
                          content: SizedBox(
                            height: 250.0,
                            child: DefaultTabController(
                              length: tabs.length,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // Payment Options Tab Bar
                                  Expanded(
                                    flex: 1,
                                    child: TabBar(
                                      tabs: tabs,
                                      labelColor: Colors.blue,
                                      unselectedLabelColor: Colors.black87,
                                      onTap: (value) {
                                        setState(() {
                                          _tabsState = value;
                                        });
                                      },
                                    ),
                                  ),

                                  // Payment Option Tab Bar View
                                  Expanded(
                                    flex: 6,
                                    child: TabBarView(children: [
                                      // Paying Using Card Widget
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Expanded(
                                                flex: 4,
                                                child: MyTextFormField(
                                                  onChanged: (value) {
                                                    setState(() {
                                                      cardHolderName = value;
                                                    });
                                                  },
                                                  textInputType:
                                                      TextInputType.name,
                                                  labelText:
                                                      "Card Holder's Name",
                                                  obscuredText: false,
                                                  changeObscuredText: null,
                                                  prefixIcon: const Icon(
                                                      Icons.account_box),
                                                  initialValue: null,
                                                ),
                                              ),
                                              const SizedBox(
                                                width: 16.0,
                                              ),
                                              Expanded(
                                                flex: 1,
                                                child: MyTextFormField(
                                                  onChanged: (value) {
                                                    setState(() {
                                                      cvc = value;
                                                    });
                                                  },
                                                  textInputType:
                                                      const TextInputType
                                                          .numberWithOptions(),
                                                  labelText: "CVC",
                                                  obscuredText: false,
                                                  changeObscuredText: null,
                                                  prefixIcon: const Icon(
                                                      Icons.security),
                                                  initialValue: null,
                                                ),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Expanded(
                                                flex: 4,
                                                child: MyTextFormField(
                                                  onChanged: (value) {
                                                    setState(() {
                                                      cardNumber = value;
                                                    });
                                                  },
                                                  textInputType:
                                                      TextInputType.name,
                                                  labelText: "Card Number",
                                                  obscuredText: false,
                                                  changeObscuredText: null,
                                                  prefixIcon: const Icon(
                                                      Icons.confirmation_num),
                                                  initialValue: null,
                                                ),
                                              ),
                                              const SizedBox(
                                                width: 16.0,
                                              ),
                                              Expanded(
                                                flex: 2,
                                                child: MyTextFormField(
                                                  onChanged: (value) {
                                                    setState(() {
                                                      expiredDate = value;
                                                    });
                                                  },
                                                  textInputType:
                                                      TextInputType.name,
                                                  labelText: "EXP",
                                                  obscuredText: false,
                                                  changeObscuredText: null,
                                                  prefixIcon: const Icon(
                                                      Icons.date_range),
                                                  initialValue: null,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),

                                      // Paying Bank Link Widget
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          SizedBox(
                                            width: double.infinity,
                                            height: 50.0,
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.fromLTRB(
                                                      64.0, 0.0, 64.0, 0.0),
                                              child: OutlinedButton(
                                                  onPressed: () {
                                                    debugPrint(
                                                        "Connect to the bank");
                                                  },
                                                  child: const Text(
                                                      "Link Bank Account")),
                                            ),
                                          ),
                                        ],
                                      )
                                    ]),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        Step(
                          title: const Text("Review"),
                          content: SizedBox(
                            height: 300.0,
                            child: ListView(
                              children: [
                                RichText(
                                    text: const TextSpan(
                                  text:
                                      "I acknowledge that clicking “Complete Investment” below represents an e-signature as detailed in our terms of use. I acknowledge that my account and payment information will be saved to file for future transactions on my account. I acknowledge that I have reviewed and understand the educational materials. I understand that the entire amount of my investment is at risk and may be lost, and am in a financial position to bear the loss of the investment. \n\n",
                                  style: TextStyle(color: Colors.black),
                                  children: [
                                    TextSpan(
                                      text:
                                          "I acknowledge that, by completing this investment commitment, I can cancel my investment at any time up until 48 hours prior to the target offering deadline. I acknowledge it may be difficult to resell the securities I acquire. \n\n",
                                      style: TextStyle(color: Colors.black),
                                    ),
                                    TextSpan(
                                      text:
                                          "If you are a non-accredited investor, please review the following acknowledgements which apply to your investment: \n\n",
                                      style: TextStyle(color: Colors.black),
                                    ),
                                    TextSpan(
                                      text:
                                          "I acknowledge during the past 12-months, my total investments in Regulation Crowdfunding offerings, across all platforms, including this investment, will not exceed the investment limit applicable to my income or net worth and may not exceed \$107,000. \n\n",
                                      style: TextStyle(color: Colors.black),
                                    ),
                                    TextSpan(
                                      text:
                                          "I acknowledge that my total investments in Regulation Crowdfunding offerings across platforms outside of StartEngine Capital, LLC do not exceed \$2,200.00. \n\n",
                                      style: TextStyle(color: Colors.black),
                                    ),
                                    TextSpan(
                                      text:
                                          "I have read and agree to the terms set in the Subscription Agreement\n\n",
                                      style: TextStyle(color: Colors.black),
                                    ),
                                    TextSpan(
                                      text:
                                          "By clicking \"Complete Investment\" you agree with our Terms and Conditions  &  Privacy Policy \n\n",
                                      style: TextStyle(color: Colors.black),
                                    ),
                                  ],
                                )),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              // Existing Projectd indications
              Expanded(
                flex: 1,
                child: SizedBox(
                  height: 400.0,
                  child: ListView(
                    children: [
                      // EagleDel-1 Project Budget
                      Card(
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(8.0,16.0,8.0,16.0),
                          child: Column(
                            children: [
                              const Text("EagleDel-1 Project"),
                              const SizedBox(height: 4.0,),
                              const Text("Progression"),
                              const SizedBox(height: 16.0,),
                              LinearPercentIndicator(
                                alignment: MainAxisAlignment.center,
                                animation: true,
                                lineHeight: 20.0,
                                animationDuration: 2000,
                                percent: (EagleDelProjectBudget.calculatePercentCompleted()).round()/100,
                                center: Text("${(EagleDelProjectBudget.calculatePercentCompleted()).round()}%"),
                                barRadius: const Radius.circular(16.0),
                                progressColor: Colors.yellowAccent,
                              ),
                            ]
                          ),
                        ),
                      ),

                    ],
                  )
                ),
              ),
            ],
          ),
          const FooterWidget(),
        ],
      ),
    );
  }
}

class EagleDelProjectBudget {
  static calculatePercentCompleted() {}
}
