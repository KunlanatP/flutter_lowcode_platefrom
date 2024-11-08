import 'dart:convert';

import "package:benchmark_harness/benchmark_harness.dart";
import "package:flutter/material.dart";
import "package:flutter_test/flutter_test.dart";
import "package:render_engine/render_engine.dart";

const paddingApp = """
{
  "id": "2bc4893f-5144-4dc1-b6e2-1102baf6ef7a",
  "type": "padding",
  "props": {
    "padding": 10
  },
  "child": {
    "id": "c1a9555c-a731-4524-9860-b4f37a98ae15",
    "type": "padding",
    "props": {
      "padding": 15
    },
    "child": {
      "id": "d4ffea24-3b84-49bb-9a14-4dbbc2755c4d",
      "type": "padding",
      "props": {
        "padding": 20
      },
      "child": {
        "id": "5cc32827-935a-4c5f-bf53-73f6bef39ede",
        "type": "padding",
        "props": {
          "padding": 15
        },
        "child": {
          "id": "19aa305f-d7d4-4123-94df-caaaea232f29",
          "type": "padding",
          "props": {
            "padding": 20
          },
          "child": {
            "id": "f2bd1e13-43c9-4e86-b872-f8b103865bd4",
            "type": "padding",
            "props": {
              "padding": 15
            },
            "child": {
              "id": "a0b5d6aa-56c4-4fde-96b0-0e801c3ebe67",
              "type": "padding",
              "props": {
                "padding": 20
              },
              "child": {
                "id": "1369a6a5-15f2-446a-9d8a-b64e8f588eac",
                "type": "padding",
                "props": {
                  "padding": 15
                },
                "child": {
                  "id": "d6e85d78-7ec3-4a81-9339-d74f2642207a",
                  "type": "padding",
                  "props": {
                    "padding": 20
                  },
                  "child": {
                    "id": "1b6534a2-3f78-464f-bbd1-63ea037ecda8",
                    "type": "padding",
                    "props": {
                      "padding": 15
                    },
                    "child": {
                      "id": "5eae3569-7cf9-444e-8ba6-7427d9689420",
                      "type": "padding",
                      "props": {
                        "padding": 20
                      },
                      "child": {
                        "id": "87738903-d3fc-48f0-a322-6dcb3bb22156",
                        "type": "padding",
                        "props": {
                          "padding": 15
                        },
                        "child": {
                          "id": "35e5f62e-6d5a-448e-b1d4-2e8cb8bdc10e",
                          "type": "padding",
                          "props": {
                            "padding": 20
                          },
                          "child": {
                            "id": "27a04d2f-2bf8-425f-b1e8-d77a45fab015",
                            "type": "padding",
                            "props": {
                              "padding": 15
                            },
                            "child": {
                              "id": "7a35f1b0-f909-44dd-adb7-acc1d9884f6e",
                              "type": "padding",
                              "props": {
                                "padding": 20
                              },
                              "child": {
                                "id": "b8af35d9-fa35-4e72-90fe-7b2680974a17",
                                "type": "padding",
                                "props": {
                                  "padding": 15
                                },
                                "child": {
                                  "id": "01291d1c-7a05-48ae-8e00-8b6e8cb8d118",
                                  "type": "padding",
                                  "props": {
                                    "padding": 20
                                  },
                                  "child": {
                                    "id": "18f36950-710a-44da-ae4c-2d5d077c5c3e",
                                    "type": "padding",
                                    "props": {
                                      "padding": 15
                                    },
                                    "child": {
                                      "id": "f5667eac-7541-4f95-9113-37791d342a1a",
                                      "type": "padding",
                                      "props": {
                                        "padding": 20
                                      },
                                      "child": {
                                        "id": "99c43aff-32a9-4988-bc9a-322c0f0eff44",
                                        "type": "padding",
                                        "props": {
                                          "padding": 15
                                        },
                                        "child": {
                                          "id": "be6608a7-2531-43d8-bc3b-f9aac7bec36e",
                                          "type": "padding",
                                          "props": {
                                            "padding": 20
                                          },
                                          "child": {
                                            "id": "bb69b521-e7d0-4ec8-be8b-583c82965a55",
                                            "type": "padding",
                                            "props": {
                                              "padding": 15
                                            },
                                            "child": {
                                              "id": "0f958164-af54-4b23-8844-3f351b59e8ca",
                                              "type": "padding",
                                              "props": {
                                                "padding": 20
                                              },
                                              "child": {
                                                "id": "dabc1d13-cb52-4a76-9a06-c32cc4071c98",
                                                "type": "padding",
                                                "props": {
                                                  "padding": 15
                                                },
                                                "child": {
                                                  "id": "8b278607-f530-430a-8770-9a1827dbf452",
                                                  "type": "padding",
                                                  "props": {
                                                    "padding": 20
                                                  },
                                                  "child": {
                                                    "id": "719578a6-931e-493a-975f-44fc5f0d05d1",
                                                    "type": "padding",
                                                    "props": {
                                                      "padding": 15
                                                    },
                                                    "child": {
                                                      "id": "2dd138e2-f1c3-427c-a062-dbddcd8118d7",
                                                      "type": "padding",
                                                      "props": {
                                                        "padding": 20
                                                      },
                                                      "child": {
                                                        "id": "ed7aa034-50a5-490d-8675-b181e2b7bbad",
                                                        "type": "padding",
                                                        "props": {
                                                          "padding": 15
                                                        },
                                                        "child": {
                                                          "id": "02620f16-2562-4eaf-9f55-22dd5e24b3cf",
                                                          "type": "padding",
                                                          "props": {
                                                            "padding": 20
                                                          },
                                                          "child": {
                                                            "id": "66390c97-637e-48bc-8333-0364a88aa702",
                                                            "type": "padding",
                                                            "props": {
                                                              "padding": 15
                                                            },
                                                            "child": {
                                                              "id": "6abf0371-d964-4d4b-9e67-2ac3bef409c1",
                                                              "type": "padding",
                                                              "props": {
                                                                "padding": 20
                                                              },
                                                              "child": {
                                                                "id": "47474927-7ac1-4e77-a282-605220378730",
                                                                "type": "padding",
                                                                "props": {
                                                                  "padding": 15
                                                                },
                                                                "child": {
                                                                  "id": "0bb3b4f3-46fa-4ceb-82dc-b91f3866ae93",
                                                                  "type": "padding",
                                                                  "props": {
                                                                    "padding": 20
                                                                  },
                                                                  "child": {
                                                                    "id": "5d91bcfd-59e7-478a-8bc4-12eb45cd92af",
                                                                    "type": "padding",
                                                                    "props": {
                                                                      "padding": 15
                                                                    },
                                                                    "child": {
                                                                      "id": "40c9dea1-2f01-4b8d-80a7-345ab4901a40",
                                                                      "type": "padding",
                                                                      "props": {
                                                                        "padding": 20
                                                                      },
                                                                      "child": {
                                                                        "id": "7ef40561-42a3-4796-b4bc-1dd31add9265",
                                                                        "type": "text",
                                                                        "props": {
                                                                          "data": "Hello, World!"
                                                                        }
                                                                      }
                                                                    }
                                                                  }
                                                                }
                                                              }
                                                            }
                                                          }
                                                        }
                                                      }
                                                    }
                                                  }
                                                }
                                              }
                                            }
                                          }
                                        }
                                      }
                                    }
                                  }
                                }
                              }
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
}
""";

final json = jsonDecode(paddingApp);

class BenchmarkPaddingApp extends BenchmarkBase {
  const BenchmarkPaddingApp() : super("BenchmarkPaddingApp");

  // The benchmark code.
  @override
  void run() {
    MaterialApp(
      home: Builder(
        builder: (context) {
          if (json == null || json['type'] == null) {
            throw FlutterError("Root widget json is null");
          }
          return WidgetFactory.build(context, widget: json)!;
        },
      ),
    );
  }
}

main() {
  setUp(() => {WidgetFactory.ensureInitialized()});
  test("Benchmark render padding text", () {
    const BenchmarkPaddingApp().report();
  });
}
