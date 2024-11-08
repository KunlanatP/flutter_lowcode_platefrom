import "dart:math";

import "package:render_engine/render_engine.dart";
import "package:uuid/uuid.dart";

var demoList = <Map<String, dynamic>>[
  {
    "title": "SliderFactory",
    "data": {
      "id": "9c41a491-fa1b-49d4-aab6-bac49fe8bf3d",
      "props": {"colorTheme": "#FFFFFFFF"},
      "title": "scaffold",
      "type": "scaffold",
      "body": {
        "id": "234eec7c-7ffa-4670-a026-73c68deb1037",
        "title": "slider",
        "type": "slider",
        'props': {
          'value': 0.5,
          'min': 0.0,
          'max': 1.0,
          'divisions': 10,
          'activeColor': '#FF2196F3',
          'inactiveColor': '#FFBDBDBD',
        },
      }
    }
  },
  {
    "title": "Modal Sheet",
    "data": {
      "id": const Uuid().v4(),
      "props": {
        "colorTheme": "#FFFFFFFF",
        "isDismissible": false,
        "animationStyle": "customs",
        "animationStyleCustoms": {
          "duration": 3,
          "reverseDuration": 1,
        }
      },
      "title": "modal",
      "type": "modal",
      "body": {
        "id": const Uuid().v4(),
        "props": {
          "alignment": "center",
          "colorTheme": "#FF323232",
          "icon": {
            "data": "add",
            "size": 64,
            "theme": "filled",
            "iconType": "fluent",
          },
        },
        "title": "icon",
        "type": "icon"
      }
    }
  },
  {
    "title": "Data Grid Widget",
    "data": {
      "id": "9c41a491-fa1b-49d4-aab6-bac49fe8bf3d",
      "props": {"colorTheme": "#FFFFFFFF"},
      "title": "scaffold",
      "type": "scaffold",
      "body": {
        "id": "234eec7c-7ffa-4670-a026-73c68deb1037",
        "title": "dataGrid",
        "type": "dataGrid",
        "props": {
          'headerColor': 'FFCBCBCB',
          'columnWidthMode': 'fill',
          'isLoadMoreView': true
        },
        'columns': [
          {
            'id': const Uuid().v4(),
            'columnName': 'id',
            'columnValue': 'ID',
            'columnType': 'String',
          },
          {
            'id': const Uuid().v4(),
            'columnName': 'name',
            'columnValue': 'Name',
            'columnType': 'String',
          },
          {
            'id': const Uuid().v4(),
            'columnName': 'designation',
            'columnValue': 'Designation',
            'columnType': 'String',
          },
          {
            'id': const Uuid().v4(),
            'columnName': 'salary',
            'columnValue': 'Salary',
            'columnType': 'int',
          },
        ],
        'dataSource': [
          {
            "itemId": const Uuid().v4(),
            "id": "100",
            "name": "Welli",
            "designation": "Manager",
            "salary": 10000 + Random().nextInt(10000),
          },
          {
            "itemId": const Uuid().v4(),
            "id": "101",
            "name": "Blonp",
            "designation": "Project Lead",
            "salary": 10000 + Random().nextInt(10000),
          },
          {
            "itemId": const Uuid().v4(),
            "id": "102",
            "name": "Folko",
            "designation": "Manager",
            "salary": 10000 + Random().nextInt(10000),
          },
          {
            "itemId": const Uuid().v4(),
            "id": "103",
            "name": "Furip",
            "designation": "Project Lead",
            "salary": 10000 + Random().nextInt(10000),
          },
          {
            "itemId": const Uuid().v4(),
            "id": "104",
            "name": "Folig",
            "designation": "Developer",
            "salary": 10000 + Random().nextInt(10000),
          },
          {
            "itemId": const Uuid().v4(),
            "id": "105",
            "name": "Picco",
            "designation": "Developer",
            "salary": 10000 + Random().nextInt(10000),
          },
          {
            "itemId": const Uuid().v4(),
            "id": "106",
            "name": "Frans",
            "designation": "System Analyst",
            "salary": 10000 + Random().nextInt(10000),
          },
          {
            "itemId": const Uuid().v4(),
            "id": "107",
            "name": "Warth",
            "designation": "System Analyst",
            "salary": 10000 + Random().nextInt(10000),
          },
          {
            "itemId": const Uuid().v4(),
            "id": "108",
            "name": "Linod",
            "designation": "Designer",
            "salary": 10000 + Random().nextInt(10000),
          },
          {
            "itemId": const Uuid().v4(),
            "id": "109",
            "name": "Simop",
            "designation": "Developer",
            "salary": 10000 + Random().nextInt(10000),
          },
          {
            "itemId": const Uuid().v4(),
            "id": "110",
            "name": "Merep",
            "designation": "Designer",
            "salary": 10000 + Random().nextInt(10000),
          },
          {
            "itemId": const Uuid().v4(),
            "id": "111",
            "name": "Riscu",
            "designation": "Developer",
            "salary": 10000 + Random().nextInt(10000),
          },
          {
            "itemId": const Uuid().v4(),
            "id": "112",
            "name": "Seves",
            "designation": "Manager",
            "salary": 10000 + Random().nextInt(10000),
          },
          {
            "itemId": const Uuid().v4(),
            "id": "113",
            "name": "Vaffe",
            "designation": "System Analyst",
            "salary": 10000 + Random().nextInt(10000),
          },
          {
            "itemId": const Uuid().v4(),
            "id": "114",
            "name": "Alfki",
            "designation": "CEO",
            "salary": 100000 + Random().nextInt(100000),
          }
        ]
      }
    }
  },
  {
    "title": "Table Widget",
    "data": {
      "body": {
        "children": [
          {
            "children": [
              {
                "children": [
                  {
                    "child": {
                      "id": "f91d909a-df5a-42b9-a337-b0ccd7d94038",
                      "props": {
                        "data": "Test 1",
                        "maxLines": "1",
                        "softWrap": true,
                        "style": {
                          "colorTheme": "#FF323232",
                          "decoration": "none",
                          "fontFamily": "Roboto",
                          "fontSize": 14,
                          "fontStyle": "normal",
                          "fontWeight": "w800",
                          "letterSpacing": 0.3
                        },
                        "textAlign": "center"
                      },
                      "title": "text",
                      "type": "text"
                    },
                    "id": "c4c5aceb-0bee-447c-ad01-17b11e15c6b4",
                    "props": {},
                    "title": "tableCell",
                    "type": "tableCell"
                  },
                  {
                    "child": {
                      "id": "4b4c6294-5518-4a58-b504-d25c010a52ca",
                      "props": {
                        "data": "Test 2",
                        "maxLines": "1",
                        "softWrap": true,
                        "style": {
                          "colorTheme": "#FF323232",
                          "decoration": "none",
                          "fontFamily": "Roboto",
                          "fontSize": 14,
                          "fontStyle": "normal",
                          "fontWeight": "w800",
                          "letterSpacing": 0.3
                        },
                        "textAlign": "center"
                      },
                      "title": "text",
                      "type": "text"
                    },
                    "id": "a628ca26-6b61-46f2-b11d-dbff78f9b6c9",
                    "props": {},
                    "title": "tableCell",
                    "type": "tableCell"
                  },
                  {
                    "child": {
                      "id": "6019d915-8a13-44e6-9d0f-d45ef8441b77",
                      "props": {
                        "data": "Test 3",
                        "maxLines": "1",
                        "softWrap": true,
                        "style": {
                          "colorTheme": "#FF323232",
                          "decoration": "none",
                          "fontFamily": "Roboto",
                          "fontSize": 14,
                          "fontStyle": "normal",
                          "fontWeight": "w800",
                          "letterSpacing": 0.3
                        },
                        "textAlign": "center"
                      },
                      "title": "text",
                      "type": "text"
                    },
                    "id": "c7bcccf2-1bcc-4dba-8968-212e80b8a42a",
                    "props": {},
                    "title": "tableCell",
                    "type": "tableCell"
                  }
                ],
                "id": "1ca1784d-f06c-4c01-bdac-bee754cf2e89",
                "title": "tableRow",
                "type": "tableRow"
              }
            ],
            "id": "c28c42a6-1291-43b6-a095-eb1bc4c6b0f4",
            "props": {},
            "title": "tableHeader",
            "type": "tableHeader"
          },
          {
            "children": [
              {
                "children": [
                  {
                    "child": {
                      "id": "181a180b-e85e-4c8f-8992-0f71b7a24ad0",
                      "props": {
                        "data": "Row 1 / Cell 1",
                        "maxLines": "1",
                        "softWrap": true,
                        "style": {
                          "colorTheme": "#FF323232",
                          "decoration": "none",
                          "fontFamily": "Roboto",
                          "fontSize": 14,
                          "fontStyle": "normal",
                          "fontWeight": "w400",
                          "letterSpacing": 0.3
                        },
                        "textAlign": "left"
                      },
                      "title": "text",
                      "type": "text"
                    },
                    "id": "e82feaf7-1c00-457c-be9d-1c15e018e7bf",
                    "props": {},
                    "title": "tableCell",
                    "type": "tableCell"
                  },
                  {
                    "child": {
                      "id": "86250009-7f95-4984-8e6d-1717fe0e16e7",
                      "props": {
                        "data": "Row 1 / Cell 2",
                        "maxLines": "1",
                        "softWrap": true,
                        "style": {
                          "colorTheme": "#FF323232",
                          "decoration": "none",
                          "fontFamily": "Roboto",
                          "fontSize": 14,
                          "fontStyle": "normal",
                          "fontWeight": "w400",
                          "letterSpacing": 0.3
                        },
                        "textAlign": "left"
                      },
                      "title": "text",
                      "type": "text"
                    },
                    "id": "40060ec4-b299-4a84-84d2-50e5350db402",
                    "props": {},
                    "title": "tableCell",
                    "type": "tableCell"
                  },
                  {
                    "child": {
                      "id": "b5dbf523-f587-4c38-b6f4-1875779deef7",
                      "props": {
                        "data": "Row 1 / Cell 3",
                        "maxLines": "1",
                        "softWrap": true,
                        "style": {
                          "colorTheme": "#FF323232",
                          "decoration": "none",
                          "fontFamily": "Roboto",
                          "fontSize": 14,
                          "fontStyle": "normal",
                          "fontWeight": "w400",
                          "letterSpacing": 0.3
                        },
                        "textAlign": "left"
                      },
                      "title": "text",
                      "type": "text"
                    },
                    "id": "045782f3-70dd-40d8-bfe8-44fcfc979ebc",
                    "props": {},
                    "title": "tableCell",
                    "type": "tableCell"
                  }
                ],
                "id": "b26a5196-9d5a-4c08-a98c-e1e6b933d8a3",
                "props": {},
                "title": "tableRow",
                "type": "tableRow"
              },
              {
                "children": [
                  {
                    "child": {
                      "id": "459dd96b-8983-4e58-b827-7c3fd57e3071",
                      "props": {
                        "data": "Row 2 / Cell 1",
                        "maxLines": "1",
                        "softWrap": true,
                        "style": {
                          "colorTheme": "#FF323232",
                          "decoration": "none",
                          "fontFamily": "Roboto",
                          "fontSize": 14,
                          "fontStyle": "normal",
                          "fontWeight": "w400",
                          "letterSpacing": 0.3
                        },
                        "textAlign": "left"
                      },
                      "title": "text",
                      "type": "text"
                    },
                    "id": "39041fbb-5f12-4652-ba82-4e606e9d292c",
                    "props": {},
                    "title": "tableCell",
                    "type": "tableCell"
                  },
                  {
                    "child": {
                      "id": "7a7a3bcc-5dfa-46db-bda7-610d1c54398e",
                      "props": {
                        "data": "Row 2 / Cell 2",
                        "maxLines": "1",
                        "softWrap": true,
                        "style": {
                          "colorTheme": "#FF323232",
                          "decoration": "none",
                          "fontFamily": "Roboto",
                          "fontSize": 14,
                          "fontStyle": "normal",
                          "fontWeight": "w400",
                          "letterSpacing": 0.3
                        },
                        "textAlign": "left"
                      },
                      "title": "text",
                      "type": "text"
                    },
                    "id": "7a4e7392-0a0d-4923-8072-b06e96eb637f",
                    "props": {},
                    "title": "tableCell",
                    "type": "tableCell"
                  },
                  {
                    "child": {
                      "idv": "child_3",
                      "props": {
                        "data": "Row 2 / Cell 3",
                        "maxLines": "1",
                        "softWrap": true,
                        "style": {
                          "colorTheme": "#FF323232",
                          "decoration": "none",
                          "fontFamily": "Roboto",
                          "fontSize": 14,
                          "fontStyle": "normal",
                          "fontWeight": "w400",
                          "letterSpacing": 0.3
                        },
                        "textAlign": "left"
                      },
                      "title": "text",
                      "type": "text"
                    },
                    "id": "bdbc3ad1-aa99-41ae-83f9-998d40377014",
                    "props": {},
                    "title": "tableCell",
                    "type": "tableCell"
                  }
                ],
                "id": "dac5fce3-f014-416e-8470-ece56dac7299",
                "props": {},
                "title": "tableRow",
                "type": "tableRow"
              },
              {
                "children": [
                  {
                    "child": {
                      "id": "762ff626-d09e-41ee-b0ef-faa0aae5bbae",
                      "props": {
                        "data": "Row 3 / Cell 1",
                        "maxLines": "1",
                        "softWrap": true,
                        "style": {
                          "colorTheme": "#FF323232",
                          "decoration": "none",
                          "fontFamily": "Roboto",
                          "fontSize": 14,
                          "fontStyle": "normal",
                          "fontWeight": "w400",
                          "letterSpacing": 0.3
                        },
                        "textAlign": "left"
                      },
                      "title": "text",
                      "type": "text"
                    },
                    "id": "b5cf5d6c-6658-4081-a9f5-e774877c2825",
                    "props": {},
                    "title": "tableCell",
                    "type": "tableCell"
                  },
                  {
                    "child": {
                      "id": "7b673af1-fb40-496a-8dcd-5669b7a83497",
                      "props": {
                        "data": "Row 3 / Cell 2",
                        "maxLines": "1",
                        "softWrap": true,
                        "style": {
                          "colorTheme": "#FF323232",
                          "decoration": "none",
                          "fontFamily": "Roboto",
                          "fontSize": 14,
                          "fontStyle": "normal",
                          "fontWeight": "w400",
                          "letterSpacing": 0.3
                        },
                        "textAlign": "left"
                      },
                      "title": "text",
                      "type": "text"
                    },
                    "id": "badf0951-9878-4082-a055-7829c8dcb616",
                    "props": {},
                    "title": "tableCell",
                    "type": "tableCell"
                  },
                  {
                    "child": {
                      "id": "4ad0bae7-a89c-47f4-a457-64bea96d6238",
                      "props": {
                        "data": "Row 3 / Cell 3",
                        "maxLines": "1",
                        "softWrap": true,
                        "style": {
                          "colorTheme": "#FF323232",
                          "decoration": "none",
                          "fontFamily": "Roboto",
                          "fontSize": 14,
                          "fontStyle": "normal",
                          "fontWeight": "w400",
                          "letterSpacing": 0.3
                        },
                        "textAlign": "left"
                      },
                      "title": "text",
                      "type": "text"
                    },
                    "id": "35796c56-6a7e-4ed2-9a45-247c9d97ba37",
                    "props": {},
                    "title": "tableCell",
                    "type": "tableCell"
                  }
                ],
                "id": "25a8f2c5-4cbd-4cdb-88a5-81ff385cf696",
                "props": {},
                "title": "tableRow",
                "type": "tableRow"
              }
            ],
            "id": "d2cdcde6-699d-415a-b4fd-6a6996c765a2",
            "props": {},
            "title": "tableBody",
            "type": "tableBody"
          }
        ],
        "id": "234eec7c-7ffa-4670-a026-73c68deb1037",
        "props": {
          "tableBorder": {
            "colorTheme": "FF323232",
            "left": true,
            "top": true,
            "right": true,
            "bottom": true,
            "horizontal": true,
            "vertical": true,
          },
          "alignment": "center",
          "columnWidths": {},
        },
        "title": "table",
        "type": "table"
      },
      "id": "9c41a491-fa1b-49d4-aab6-bac49fe8bf3d",
      "props": {"colorTheme": "#FFFFFFFF"},
      "title": "scaffold",
      "type": "scaffold"
    }
  },
  {
    "title": "Custom Icon Widget",
    "data": {
      "body": {
        "id": const Uuid().v4(),
        "props": {
          "alignment": "center",
          "colorTheme": "#FF323232",
          "icon": {
            "data":
                "{\"appId\":\"02dd96c2-cba3-5c37-b248-2054c345f981\",\"fileId\":\"fc930c51-45e8-4c6e-9c2b-114694bc27aa\",\"fileName\":\"cloud_sun\",\"iconData\":{\"codePoint\":\"0x0E81C\",\"fontFamily\":\"Meteocons\"}}",
            "iconType": "customs",
            "size": 36,
            "theme": "regular"
          },
        },
        "title": "icon",
        "type": "icon"
      },
      "id": const Uuid().v4(),
      "props": {"colorTheme": "#FFFFFFFF"},
      "title": "scaffold",
      "type": "scaffold"
    },
  },
  {
    "title": "Video Player [VideoLink Url]",
    "data": {
      "id": "f3c868b7-d0b5-482b-92ac-b849a7e47bd3",
      "type": "scaffold",
      "props": {
        "padding": 20,
        "themeMode": "darkMode",
        "colorTheme": "#FFFFFFFF",
      },
      "body": {
        "id": "7510d3cf-ffcc-4435-9885-0e6867805c3b",
        "type": "center",
        "child": {
          "id": "8b2f49b0-ef81-4a3a-840d-a6eafb97a20b",
          "type": "videoPlayer",
          "props": {
            "videoType": "videoLink",
            "videoLink":
                "https://assets.mixkit.co/videos/preview/mixkit-forest-stream-in-the-sunlight-528-large.mp4",
            "youTube": "https://www.youtube.com/watch?v=3i5_v_sUZ04",
            "facebook":
                "https://www.facebook.com/plugins/video.php?href=https%3A%2F%2Fweb.facebook.com%2FMeetAvalant%2Fvideos%2F2584937528495627",
            "autoPlay": true,
            "looping": true,
            "showControls": true,
            "allowFullScreen": true,
            "allowPlaybackSpeedMenu": false,
            "lazyLoad": false,
            "pauseOnNavigate": true,
          }
        }
      }
    },
  },
  {
    "title": "Video Player [YouTube Url]",
    "data": {
      "id": "f3c868b7-d0b5-482b-92ac-b849a7e47bd3",
      "type": "scaffold",
      "props": {
        "padding": 20,
        "themeMode": "darkMode",
        "colorTheme": "#FFFFFFFF",
      },
      "body": {
        "id": "7510d3cf-ffcc-4435-9885-0e6867805c3b",
        "type": "center",
        "child": {
          "id": "8b2f49b0-ef81-4a3a-840d-a6eafb97a20b",
          "type": "videoPlayer",
          "props": {
            "videoType": "youTube",
            "videoLink":
                "https://assets.mixkit.co/videos/preview/mixkit-forest-stream-in-the-sunlight-528-large.mp4",
            "youTube": "https://www.youtube.com/watch?v=3i5_v_sUZ04",
            "facebook":
                "https://www.facebook.com/plugins/video.php?href=https%3A%2F%2Fweb.facebook.com%2FMeetAvalant%2Fvideos%2F2584937528495627",
            "autoPlay": true,
            "looping": true,
            "showControls": true,
            "allowFullScreen": true,
            "allowPlaybackSpeedMenu": false,
            "lazyLoad": false,
            "pauseOnNavigate": true,
          }
        }
      }
    },
  },
  {
    "title": "Video Player [Facebook Url]",
    "data": {
      "id": "f3c868b7-d0b5-482b-92ac-b849a7e47bd3",
      "type": "scaffold",
      "props": {
        "padding": 20,
        "themeMode": "darkMode",
        "colorTheme": "#FFFFFFFF",
      },
      "body": {
        "id": "7510d3cf-ffcc-4435-9885-0e6867805c3b",
        "type": "center",
        "child": {
          "id": "8b2f49b0-ef81-4a3a-840d-a6eafb97a20b",
          "type": "videoPlayer",
          "props": {
            "videoType": "facebook",
            "videoLink":
                "https://assets.mixkit.co/videos/preview/mixkit-forest-stream-in-the-sunlight-528-large.mp4",
            "youTube": "https://www.youtube.com/watch?v=3i5_v_sUZ04",
            "facebook":
                "https://www.facebook.com/plugins/video.php?href=https%3A%2F%2Fweb.facebook.com%2FMeetAvalant%2Fvideos%2F2584937528495627",
            "autoPlay": true,
            "looping": true,
            "showControls": true,
            "allowFullScreen": true,
            "allowPlaybackSpeedMenu": false,
            "lazyLoad": false,
            "pauseOnNavigate": true,
          }
        }
      }
    },
  },
  {
    "title": "QR Code Rendering",
    "data": {
      "id": "f3c868b7-d0b5-482b-92ac-b849a7e47bd3",
      "type": "scaffold",
      "props": {
        "padding": 20,
        "themeMode": "darkMode",
        "colorTheme":
            "{\"default\":{\"primary\":{\"lightMode\":\"#FFB3261E\",\"darkMode\":\"#FFF2B8B5\"}}}",
      },
      "body": {
        "id": "d0bdb074-9a48-4ebb-be9d-9742684e9208",
        "type": "padding",
        "props": {"padding": 20},
        "child": {
          "id": "7510d3cf-ffcc-4435-9885-0e6867805c3b",
          "type": "center",
          "child": {
            "id": "8b2f49b0-ef81-4a3a-840d-a6eafb97a20b",
            "type": "qrcode",
            "props": {
              "qrType": "render",
              "data": "Hello, QR Code",
              "version": "custom",
              "versionLavel": 3,
              "errorCorrectionLevel": 1,
              "size": 250.0,
              "backgroundColor": "#00800000",
              "dataModuleColor": "#FF800000",
              "eyeColor": "#FFFF0000",
            }
          }
        }
      }
    },
  },
  {
    "title": "QR Code Scanner",
    "data": {
      "id": "f3c868b7-d0b5-482b-92ac-b849a7e47bd3",
      "type": "scaffold",
      "props": {
        "themeMode": "darkMode",
        "colorTheme":
            "{\"default\":{\"primary\":{\"lightMode\":\"#FFB3261E\",\"darkMode\":\"#FFF2B8B5\"}}}",
      },
      "body": {
        "children": [
          {
            "id": const Uuid().v4(),
            "props": {
              "alignment": "center",
              "backgroundColor": "#00FFFFFF",
              "data": "Hello, QR Code",
              "dataModuleColor": "#FF323232",
              "errorCorrectionLevel": 1,
              "eyeColor": "#FF323232",
              "qrType": "scanner",
              "size": 150,
              "version": "auto",
              "versionLavel": -1
            },
            "title": "qrcode",
            "type": "qrcode"
          },
          {
            "id": const Uuid().v4(),
            "props": {
              "data": "ElevatedButton",
              "style": {
                "borderSide": {},
                "colorTheme":
                    "{\"default\":{\"primary\":{\"lightMode\":\"#FF6750A4\",\"darkMode\":\"#FFD0BCFF\"}}}",
                "textStyle": {
                  "colorTheme": "#FFFFFFFF",
                  "decoration": "none",
                  "fontFamily": "Roboto",
                  "fontSize": 14,
                  "fontStyle": "normal",
                  "fontWeight": "w400",
                  "letterSpacing": 0.3
                }
              },
              "type": "elevatedButton"
            },
            "title": "button",
            "type": "button"
          }
        ],
        "id": const Uuid().v4(),
        "props": {
          "crossAxis": "center",
          "mainAxis": "start",
          "mainAxisSize": "max",
          "scrolling": false
        },
        "title": "column",
        "type": "column"
      },
    },
  },
  {
    "title": "Text Widget",
    "data": {
      "id": "f3c868b7-d0b5-482b-92ac-b849a7e47bd3",
      "type": "scaffold",
      "props": {
        "padding": 20,
        "themeMode": "darkMode",
        "colorTheme":
            "{\"default\":{\"primary\":{\"lightMode\":\"#FFB3261E\",\"darkMode\":\"#FFF2B8B5\"}}}",
      },
      "body": {
        "id": "d0bdb074-9a48-4ebb-be9d-9742684e9208",
        "type": "padding",
        "props": {"padding": 20},
        "child": {
          "id": "7510d3cf-ffcc-4435-9885-0e6867805c3b",
          "type": "center",
          "child": {
            "id": "8b2f49b0-ef81-4a3a-840d-a6eafb97a20b",
            "type": "text",
            "title": "text",
            "props": {
              "data": "Hello, Example!",
              "softWrap": true,
              "maxLines": "1",
              "textAlign": "left",
              "style": {
                "fontFamily": "Abel",
                "fontSize": 34,
                "fontWeight": "w400",
                "letterSpacing": 0.25,
                "fontStyle": "normal",
                "decoration": "none",
                "colorTheme": "#FFFFFFFF"
              },
            }
          }
        }
      }
    },
  },
  {
    "title": "Text Theme",
    "data": {
      "id": "f3c868b7-d0b5-482b-92ac-b849a7e47bd3",
      "type": "scaffold",
      "props": {"padding": 20, "colorTheme": "#FFF4F4F4"},
      "body": {
        "id": "d0bdb074-9a48-4ebb-be9d-9742684e9208",
        "type": "padding",
        "props": {"padding": 20},
        "child": {
          "id": "8b2f49b0-ef81-4a3a-840d-a6eafb97a20b",
          "type": "column",
          "props": {
            "crossAxis": "center",
            "mainAxis": "start",
            "mainAxisSize": "max",
            "scrolling": false,
          },
          "children": [
            {
              "id": "1",
              "type": "text",
              "props": {
                "data": "Theme Default",
                "softWrap": true,
                "maxLines": "1",
                "textAlign": "left",
                "style": {
                  "textTheme": "headline5",
                  "colorTheme":
                      "{\"default\":{\"primary\":{\"lightMode\":\"#ffa488ef\",\"darkMode\":\"#ff270673\"}}}",
                },
                "colorTheme": "#FFF4F4F4"
              }
            },
            {
              "id": "2",
              "type": "text",
              "props": {
                "data": "Theme Custom",
                "softWrap": true,
                "maxLines": "1",
                "textAlign": "left",
                "style": {
                  "textTheme": "headline5",
                  "colorTheme":
                      "{\"custom\":{\"custom 0\":{\"lightMode\":\"#ffca00ff\",\"darkMode\":\"#ff2e2a30\"}}}",
                },
                "colorTheme": "#FFF4F4F4"
              }
            },
          ],
        }
      }
    },
  },
  {
    "title": "Button Widget",
    "data": {
      "id": "8159acf3-ad61-4bce-bd66-c6f473a6ec6a",
      "type": "scaffold",
      "props": {"padding": 20, "colorTheme": "#FFF4F4F4"},
      "body": {
        "id": "89de3627-6599-4eeb-b39c-2440cdd48545",
        "type": "padding",
        "props": {"padding": 20},
        "child": {
          "id": "97f86aea-a14a-4894-b4d8-c72ee003b474",
          "type": "column",
          "props": {
            "crossAxis": "center",
            "mainAxis": "spaceAround",
            "mainAxisSize": "max",
            "scrolling": false,
          },
          "children": [
            {
              "id": "11",
              "type": "button",
              "props": {
                "data": "ElevatedButton",
                "type": "elevatedButton",
                "alignment": "center",
                "style": {
                  "themeMode": "darkMode",
                  "colorTheme":
                      "{\"default\":{\"primary\":{\"lightMode\":\"#FFB3261E\",\"darkMode\":\"#FFF2B8B5\"}}}",
                  "borderSide": {},
                  "textStyle": {
                    "fontFamily": "Roboto",
                    "fontSize": 14.0,
                    "fontWeight": "w400",
                    "letterSpacing": 0.3,
                    "fontStyle": "normal",
                    "decoration": "none",
                    "themeMode": "darkMode",
                    "colorTheme":
                        "{\"default\":{\"primary\":{\"lightMode\":\"#FFB3261E\",\"darkMode\":\"#FFF2B8B5\"}}}",
                  },
                }
              },
              "actions": {
                "onPressed": {
                  "type": "void",
                  "args": {},
                },
              },
            },
            {
              "id": "12",
              "type": "button",
              "props": {
                "data": "ElevatedButton",
                "type": "elevatedButton",
                "alignment": "center",
                "icon": {
                  "data": "app_store",
                  "theme": "regular",
                  "colorTheme": "#FFF4F4F4",
                  "size": 16.0,
                },
                "style": {
                  "themeMode": "darkMode",
                  "colorTheme":
                      "{\"default\":{\"primary\":{\"lightMode\":\"#FFB3261E\",\"darkMode\":\"#FFF2B8B5\"}}}",
                  "borderSide": {},
                  "textStyle": {
                    "textTheme": "headline6",
                    "themeMode": "darkMode",
                    "colorTheme":
                        "{\"default\":{\"primary\":{\"lightMode\":\"#FFB3261E\",\"darkMode\":\"#FFF2B8B5\"}}}",
                  },
                }
              },
              "actions": {
                "onPressed": {
                  "type": "void",
                  "args": {},
                },
              },
            },
            {
              "id": "13",
              "type": "button",
              "props": {
                "data": "OutlinedButton",
                "type": "outlinedButton",
                "alignment": "center",
                "icon": {
                  "data": "app_store",
                  "theme": "regular",
                  "colorTheme": "#FFF4F4F4",
                  "size": 28.0,
                },
                "style": {
                  "themeMode": "darkMode",
                  "colorTheme":
                      "{\"default\":{\"primary\":{\"lightMode\":\"#FFB3261E\",\"darkMode\":\"#FFF2B8B5\"}}}",
                  "borderSide": {},
                  "textStyle": {
                    "textTheme": "headline4",
                    "themeMode": "darkMode",
                    "colorTheme":
                        "{\"default\":{\"primary\":{\"lightMode\":\"#FFB3261E\",\"darkMode\":\"#FFF2B8B5\"}}}",
                  },
                }
              },
              "actions": {
                "onPressed": {
                  "type": "void",
                  "args": {},
                },
              },
            },
            {
              "id": "14",
              "type": "button",
              "props": {
                "data": "TextButton",
                "type": "textButton",
                "alignment": "center",
                "icon": {
                  "data": "app_store",
                  "theme": "regular",
                  "colorTheme": "#FFF4F4F4",
                  "size": 28.0,
                },
                "style": {
                  "themeMode": "darkMode",
                  "colorTheme":
                      "{\"default\":{\"primary\":{\"lightMode\":\"#FFB3261E\",\"darkMode\":\"#FFF2B8B5\"}}}",
                  "borderSide": {},
                  "textStyle": {
                    "textTheme": "headline4",
                    "themeMode": "darkMode",
                    "colorTheme":
                        "{\"default\":{\"primary\":{\"lightMode\":\"#FFB3261E\",\"darkMode\":\"#FFF2B8B5\"}}}",
                  },
                }
              },
              "actions": {
                "onPressed": {
                  "type": "void",
                  "args": {},
                },
              },
            },
          ],
        },
      },
    },
  },
  {
    "title": "Text + GestureDetector",
    "data": {
      "id": "8159acf3-ad61-4bce-bd66-c6f473a6ec6a",
      "type": "scaffold",
      "props": {"padding": 20, "colorTheme": "#FFF4F4F4"},
      "body": {
        "id": "89de3627-6599-4eeb-b39c-2440cdd48545",
        "type": "padding",
        "props": {"padding": 20},
        "child": {
          "id": "b54f8713-d2ed-4fa2-92dd-a2d9b41d6ddd",
          "type": "center",
          "child": {
            "id": "97f86aea-a14a-4894-b4d8-c72ee003b474",
            "type": "text",
            "props": {
              "data": "Click me!",
              "softWrap": true,
              "maxLines": "1",
              "textAlign": "left",
              "style": {
                "fontFamily": "Roboto",
                "fontSize": 34,
                "fontWeight": "w800",
                "letterSpacing": 0.25,
                "fontStyle": "normal",
                "decoration": "none",
                "colorTheme": "#FF323232"
              },
            },
            "actions": {
              "onTap": {
                "type": "nav/push",
                "args": {
                  "target": "/home",
                }
              },
            },
          }
        }
      }
    },
  },
  {
    "title": "Text with SizedBox",
    "data": {
      "id": "1",
      "type": "scaffold",
      "props": {"padding": 20, "colorTheme": "#FFF4F4F4"},
      "body": {
        "id": "11",
        "type": "center",
        "props": {
          "height": 200,
          "width": 300,
        },
        "child": {
          "id": "111",
          "type": "sizedBox",
          "props": {
            "height": 200,
            "width": 300,
          },
          "child": {
            "id": "1111",
            "type": "center",
            "child": {
              "id": "11111",
              "type": "text",
              "props": {
                "data": "Hello, Box!",
                "softWrap": true,
                "maxLines": "1",
                "textAlign": "left",
                "style": {
                  "fontSize": 34,
                  "fontWeight": "w900",
                  "letterSpacing": 0.25,
                  "fontStyle": "normal",
                  "decoration": "none",
                  "colorTheme": "#FF323232"
                },
              }
            }
          }
        }
      }
    },
  },
  {
    "title": "TextAlign",
    "data": {
      "id": "1",
      "type": "scaffold",
      "props": {"padding": 20, "colorTheme": "#FFF4F4F4"},
      "body": {
        "id": "11",
        "type": "text",
        "props": {
          "alignment": "center",
          "data": "Hello, Text! Hello, Hello, Text! Hello, Text!",
          "softWrap": true,
          "maxLines": "10",
          "textAlign": "center",
          "style": {
            "fontSize": 34,
            "fontWeight": "w900",
            "letterSpacing": 0.25,
            "fontStyle": "normal",
            "decoration": "none",
            "colorTheme": "#FF323232"
          },
        }
      }
    },
  },
  {
    "title": "Card",
    "data": {
      "id": "f3c868b7-d0b5-482b-92ac-b849a7e47bd3",
      "type": "scaffold",
      "props": {"padding": 20, "colorTheme": "#FFF4F4F4"},
      "body": {
        "id": "d0bdb074-9a48-4ebb-be9d-9742684e9208",
        "type": "padding",
        "props": {"padding": 20},
        "child": {
          "id": "8b2f49b0-ef81-4a3a-840d-a6eafb97a20b",
          "type": "card",
          "props": {
            "themeMode": "darkMode",
            "colorTheme":
                "{\"default\":{\"primary\":{\"lightMode\":\"#FFB3261E\",\"darkMode\":\"#FFF2B8B5\"}}}",
            "width": "200",
            "height": "100",
          },
        }
      }
    },
  },
  {
    "title": "Column Widget",
    "data": {
      "id": "f3c868b7-d0b5-482b-92ac-b849a7e47bd3",
      "type": "scaffold",
      "props": {"padding": 20, "colorTheme": "#FFF4F4F4"},
      "body": {
        "id": "d0bdb074-9a48-4ebb-be9d-9742684e9208",
        "type": "padding",
        "props": {"padding": 20},
        "child": {
          "id": "8b2f49b0-ef81-4a3a-840d-a6eafb97a20b",
          "type": "column",
          "props": {
            "crossAxis": "center",
            "mainAxis": "start",
            "mainAxisSize": "max",
            "scrolling": false,
          },
          "children": [
            {
              "id": "1",
              "type": "text",
              "props": {
                "data": "Column 1",
                "softWrap": true,
                "maxLines": "1",
                "textAlign": "left",
                "style": {
                  "fontFamily": "Abel",
                  "fontSize": 34,
                  "fontWeight": "w400",
                  "letterSpacing": 0.25,
                  "fontStyle": "normal",
                  "decoration": "none",
                  "colorTheme": "#FF800000"
                },
              }
            },
            {
              "id": "2",
              "type": "text",
              "props": {
                "data": "Column 2",
                "softWrap": true,
                "maxLines": "1",
                "textAlign": "left",
                "style": {
                  "fontFamily": "Abel",
                  "fontSize": 34,
                  "fontWeight": "w400",
                  "letterSpacing": 0.25,
                  "fontStyle": "normal",
                  "decoration": "none",
                  "colorTheme": "#FF800000"
                },
              }
            },
          ],
        }
      }
    },
  },
  {
    "title": "Row Widget",
    "data": {
      "id": "f3c868b7-d0b5-482b-92ac-b849a7e47bd3",
      "type": "scaffold",
      "props": {"padding": 20, "colorTheme": "#FFF4F4F4"},
      "body": {
        "id": "d0bdb074-9a48-4ebb-be9d-9742684e9208",
        "type": "padding",
        "props": {"padding": 20},
        "child": {
          "id": "8b2f49b0-ef81-4a3a-840d-a6eafb97a20b",
          "type": "row",
          "props": {
            "crossAxis": "center",
            "mainAxis": "start",
            "mainAxisSize": "max",
            "scrolling": false,
          },
          "children": [
            {
              "id": "1",
              "type": "text",
              "props": {
                "data": "row 1",
                "softWrap": true,
                "maxLines": "1",
                "textAlign": "left",
                "style": {
                  "fontFamily": "Abel",
                  "fontSize": 34,
                  "fontWeight": "w400",
                  "letterSpacing": 0.25,
                  "fontStyle": "normal",
                  "decoration": "none",
                  "colorTheme": "#FF800000"
                }
              }
            },
            {
              "id": "2",
              "type": "text",
              "props": {
                "data": "row 2",
                "softWrap": true,
                "maxLines": "1",
                "textAlign": "left",
                "style": {
                  "fontFamily": "Abel",
                  "fontSize": 34,
                  "fontWeight": "w400",
                  "letterSpacing": 0.25,
                  "fontStyle": "normal",
                  "decoration": "none",
                  "colorTheme": "#FF800000"
                }
              }
            },
          ],
        }
      }
    },
  },
  {
    "title": "Container Widget",
    "data": {
      "id": "f3c868b7-d0b5-482b-92ac-b849a7e47bd3",
      "type": "scaffold",
      "props": {"colorTheme": "#FFE4E4E4"},
      "body": {
        "id": "d0bdb074-9a48-4ebb-be9d-9742684e9208",
        "type": "container",
        "props": {
          "alignment": "center",
          "colorTheme": "#FFE4E4E4",
          "width": "200",
          "height": "200",
          "constain": false,
          "borderRadius": {
            "constain": false,
            "topLeft": 10.0,
            "topRight": 10.0,
            "bottomLeft": 10.0,
            "bottomRight": 10.0,
          },
          "boxShadow": [
            {
              "dx": 4.0,
              "dy": 4.0,
              "blur": 10.0,
              "spread": 1.0,
              "color": "#11000000",
            },
            {
              "dx": -4.0,
              "dy": -4.0,
              "blur": 10.0,
              "spread": 1.0,
              "color": "#11000000",
            },
          ]
        },
        "child": {
          "id": "8b2f49b0-ef81-4a3a-840d-a6eafb97a20b",
          "type": "text",
          "props": {
            "data": "Hello",
            "softWrap": true,
            "maxLines": "1",
            "textAlign": "left",
            "alignment": "center",
            "style": {
              "fontFamily": "Abel",
              "fontSize": 34,
              "fontWeight": "w400",
              "letterSpacing": 0.25,
              "fontStyle": "normal",
              "decoration": "none",
              "colorTheme": "#FFFFFFFF"
            }
          }
        }
      }
    },
  },
  {
    "title": "Icon Widget",
    "data": {
      "id": "f3c868b7-d0b5-482b-92ac-b849a7e47bd3",
      "type": "scaffold",
      "props": {"colorTheme": "#FFF4F4F4"},
      "body": {
        "id": "d0bdb074-9a48-4ebb-be9d-9742684e9208",
        "type": "icon",
        "props": {
          "alignment": "center",
          "icon": {
            "data": "add",
            "size": 64,
            "theme": "filled",
            "iconType": "fluent",
          },
          "colorTheme":
              "{\"default\":{\"primary\":{\"lightMode\":\"#FFB3261E\",\"darkMode\":\"#FFF2B8B5\"}}}",
        },
      }
    },
  },
  {
    "title": "Container + Action",
    "data": {
      "id": "86c2d0ce-461f-4420-8dbf-c0ef2d3e483b",
      "type": "scaffold",
      "props": {"colorTheme": "#FFF4F4F4"},
      "body": {
        "id": "30932f83-572c-491c-ba7c-b2164465f83a",
        "type": "container",
        "props": {
          "alignment": "center",
          "borderRadius": {
            "bottomLeft": 10,
            "bottomRight": 10,
            "constain": true,
            "topLeft": 10,
            "topRight": 10
          },
          "borderSide": null,
          "boxShadow": [
            {"blur": 10, "color": "#FF480000", "dx": 4, "dy": 4, "spread": 0},
            {"blur": 10, "color": "#FFDD8F8F", "dx": -4, "dy": -4, "spread": 0}
          ],
          "colorTheme": "#FFB66363",
          "constain": false,
          "height": "100",
          "padding": null,
          "width": "300"
        },
        "actions": {
          "onTap": {
            "args": {
              "actionok": "OK",
              "message": "Description",
              "title": "Title"
            },
            "type": "alertDialog"
          }
        },
        "child": {
          "actions": {},
          "id": "3288a43c-5ded-4f89-98d2-29d49981d50b",
          "props": {
            "alignment": "center",
            "data": "Click here!",
            "softWrap": true,
            "style": {
              "colorTheme": "#FFF3E6E6",
              "decoration": "none",
              "fontFamily": "Bakbak One",
              "fontSize": 34,
              "fontStyle": "normal",
              "fontWeight": "w400",
              "height": "Infinity",
              "letterSpacing": 0.3,
              "primary": null,
              "textTheme": null,
              "width": "Infinity"
            },
            "textAlign": "left"
          },
          "type": "text"
        }
      }
    }
  },
  {
    "title": "Icon + Action",
    "data": {
      "id": "f3c868b7-d0b5-482b-92ac-b849a7e47bd3",
      "type": "scaffold",
      "props": {"colorTheme": "#FFF6F6F6"},
      "body": {
        "id": "d0bdb074-9a48-4ebb-be9d-9742684e9208",
        "type": "icon",
        "props": {
          "alignment": "center",
          "icon": {
            "data": "add",
            "size": 64,
            "theme": "filled",
            "iconType": "fluent",
          },
          "colorTheme": "#FF112233",
        },
        "actions": {
          "onTap": {
            "args": {
              "actionok": "OK",
              "message": "Description",
              "title": "Title"
            },
            "type": "alertDialog"
          }
        },
      }
    },
  },
  {
    "title": "Card + Action",
    "data": {
      "id": "f3c868b7-d0b5-482b-92ac-b849a7e47bd3",
      "type": "scaffold",
      "props": {"padding": 20, "colorTheme": "#FFF4F4F4"},
      "body": {
        "id": "d0bdb074-9a48-4ebb-be9d-9742684e9208",
        "type": "padding",
        "props": {"padding": 20},
        "child": {
          "id": "8b2f49b0-ef81-4a3a-840d-a6eafb97a20b",
          "type": "card",
          "props": {
            "alignment": "center",
            "colorTheme": "#FF800000",
            "width": "200",
            "height": "100",
          },
          "actions": {
            "onTap": {
              "args": {
                "actionok": "OK",
                "message": "Description",
                "title": "Title"
              },
              "type": "alertDialog"
            }
          },
        }
      }
    },
  },
  {
    "title": "Scaffold AppBar",
    "data": {
      "id": "f3c868b7-d0b5-482b-92ac-b849a7e47bd3",
      "type": "scaffold",
      "props": {"colorTheme": "#FFF4F4F3"},
      "appBar": {
        "actions": [
          {
            "id": "9d184813-5ce1-4565-a188-ed175d2c77d8",
            "props": {
              "colorTheme": "#FF212121",
              "icon": {
                "colorTheme": "#FF212121",
                "data": "more_vertical",
                "size": 24,
                "theme": "regular"
              }
            },
            "title": "icon",
            "type": "icon"
          }
        ],
        "appbarTitle": {
          "type": "text",
          "props": {
            "data": "Hello",
            "softWrap": true,
            "maxLines": "1",
            "textAlign": "left",
            "alignment": "center",
            "style": {
              "fontFamily": "Abel",
              "fontSize": 34,
              "fontWeight": "w400",
              "letterSpacing": 0.25,
              "fontStyle": "normal",
              "decoration": "none",
              "colorTheme": "#FFF4F4F3"
            }
          }
        },
        "id": "34a724e8-89e9-4d3a-b92d-a20a9138b5c0",
        "props": {
          "centerTitle": false,
          "colorTheme": "#FFFFFFFF",
          "elevation": 0,
          "showDefaultButton": true
        },
        "title": "appbar",
        "type": "appbar"
      },
      "body": {
        "id": "8b2f49b0-ef81-4a3a-840d",
        "type": "text",
        "props": {
          "data": "Hello, World!",
          "softWrap": true,
          "maxLines": "1",
          "textAlign": "left",
          "style": {
            "fontFamily": "Abel",
            "fontSize": 34,
            "fontWeight": "w400",
            "letterSpacing": 0.25,
            "fontStyle": "normal",
            "decoration": "none",
            "colorTheme": "#FF800000",
          },
        }
      }
    },
  },
  {
    "title": "Page with SliverAppBar",
    "data": {
      "id": "1",
      "type": "page",
      "children": [
        {
          "id": "2",
          "type": "sliverAppBar",
          "props": {
            "title": {
              "id": "3",
              "type": "text",
              "props": {
                "data": "Sliver AppBar",
                "softWrap": true,
                "maxLines": "1",
                "textAlign": "left",
                "style": {
                  "fontSize": 34,
                  "fontWeight": "w900",
                  "letterSpacing": 0.25,
                  "fontStyle": "normal",
                  "decoration": "none",
                  "colorTheme": "#FFFFFFFF"
                },
              }
            },
          }
        },
      ],
    },
  },
  {
    "title": "Image",
    "data": {
      "id": "f3c868b7-d0b5-482b-92ac-b849a7e47bd3",
      "type": "scaffold",
      "props": {"colorTheme": "#FFF4F4F4"},
      "body": {
        "id": "d0bdb074-9a48-4ebb-be9d-9742684e9208",
        "type": "image",
        "props": {
          "image": Env.backendURL + "/images/default.png",
          "width": "100",
          "height": "100",
          "fit": "cover",
          "constain": false,
          "borderRadius": {
            "constain": false,
            "topLeft": 0.0,
            "topRight": 0.0,
            "bottomLeft": 0.0,
            "bottomRight": 0.0,
          },
          "alignment": "center",
        },
      }
    },
  },
  {
    "title": "TextField",
    "data": {
      "id": "f3c868b7-d0b5-482b-92ac-b849a7e47bd3",
      "type": "scaffold",
      "props": {"padding": 20, "colorTheme": "#FFF4F4F4"},
      "body": {
        "id": "d0bdb074-9a48-4ebb-be9d-9742684e9208",
        "type": "padding",
        "props": {"padding": 20},
        "child": {
          "id": "8b2f49b0-ef81-4a3a-840d-a6eafb97a20b",
          "type": "column",
          "props": {
            "crossAxis": "center",
            "mainAxis": "spaceEvenly",
            "mainAxisSize": "max",
            "scrolling": false,
          },
          "children": [
            {
              "id": "1",
              "type": "textfield",
              "props": {
                "alignment": "center",
                "constain": false,
                "height": "32",
                "inputDecoration": {
                  "borderRadius": {
                    "bottomLeft": 4,
                    "bottomRight": 4,
                    "constain": false,
                    "topLeft": 4,
                    "topRight": 4
                  },
                  "borderType": "outline",
                  "borderstyle": {"colorTheme": "#FF323232", "width": 1},
                  "colorTheme": "#00FFFFFF",
                  "constain": false,
                  "hintText": "Enter your text"
                },
                "isVisible": false,
                "keyboardType": "text",
                "maxLines": 3,
                "minLines": 1,
                "style": {
                  "themeMode": "darkMode",
                  "colorTheme": "#FFF2B8B5",
                  "decoration": "none",
                  "fontFamily": "Roboto",
                  "fontSize": 14,
                  "fontStyle": "normal",
                  "fontWeight": "w400",
                  "letterSpacing": 0.3,
                  "textTheme": null
                },
                "width": "200"
              },
            },
            {
              "id": "2",
              "type": "textfield",
              "props": {
                "alignment": "center",
                "constain": false,
                "format":
                    "{\"firstDate\":\"01-01-2000\",\"lastDate\":\"01-01-2200\"}",
                "height": "32",
                "inputDecoration": {
                  "borderRadius": {
                    "bottomLeft": 4,
                    "bottomRight": 4,
                    "constain": false,
                    "topLeft": 4,
                    "topRight": 4
                  },
                  "borderType": "outline",
                  "borderstyle": {"colorTheme": "#FF323232", "width": 1},
                  "colorTheme": "#00FFFFFF",
                  "constain": false,
                  "hintText": "Select a Date"
                },
                "isVisible": false,
                "keyboardType": "datetime",
                "maxLines": 3,
                "minLines": 1,
                "style": {
                  "colorTheme": "#FF323232",
                  "decoration": "none",
                  "fontFamily": "Roboto",
                  "fontSize": 14,
                  "fontStyle": "normal",
                  "fontWeight": "w400",
                  "letterSpacing": 0.3,
                  "textTheme": null
                },
                "width": "200"
              },
            },
            {
              "id": "3",
              "type": "textfield",
              "props": {
                "alignment": "center",
                "constain": false,
                "height": "32",
                "inputDecoration": {
                  "borderRadius": {
                    "bottomLeft": 4,
                    "bottomRight": 4,
                    "constain": false,
                    "topLeft": 4,
                    "topRight": 4
                  },
                  "borderType": "outline",
                  "borderstyle": {"colorTheme": "#FF323232", "width": 1},
                  "colorTheme": "#00FFFFFF",
                  "constain": false,
                  "hintText": "Ex.avlgb@gmail.com"
                },
                "keyboardType": "emailAddress",
                "maxLines": 1,
                "minLines": 1,
                "style": {
                  "colorTheme": "#FF323232",
                  "decoration": "none",
                  "fontFamily": "Roboto",
                  "fontSize": 14,
                  "fontStyle": "normal",
                  "fontWeight": "w400",
                  "letterSpacing": 0.3,
                  "textTheme": null
                },
                "width": "250"
              },
            },
            {
              "id": "4",
              "type": "textfield",
              "props": {
                "alignment": "center",
                "constain": false,
                "height": "32",
                "inputDecoration": {
                  "borderRadius": {
                    "bottomLeft": 4,
                    "bottomRight": 4,
                    "constain": false,
                    "topLeft": 4,
                    "topRight": 4
                  },
                  "borderType": "outline",
                  "borderstyle": {"colorTheme": "#FF323232", "width": 1},
                  "colorTheme": "#00FFFFFF",
                  "constain": false,
                  "hintText": "Enter your text"
                },
                "isVisible": false,
                "keyboardType": "multiline",
                "maxLines": 5,
                "minLines": 1,
                "style": {
                  "colorTheme": "#FF323232",
                  "decoration": "none",
                  "fontFamily": "Roboto",
                  "fontSize": 14,
                  "fontStyle": "normal",
                  "fontWeight": "w400",
                  "letterSpacing": 0.3,
                  "textTheme": null
                },
                "width": "200"
              },
            },
            {
              "id": "5",
              "type": "textfield",
              "props": {
                "alignment": "center",
                "constain": false,
                "format": "{\"numberFormat\":\"##########\"}",
                "height": "32",
                "inputDecoration": {
                  "borderRadius": {
                    "bottomLeft": 4,
                    "bottomRight": 4,
                    "constain": false,
                    "topLeft": 4,
                    "topRight": 4
                  },
                  "borderType": "outline",
                  "borderstyle": {"colorTheme": "#FF323232", "width": 1},
                  "colorTheme": "#00FFFFFF",
                  "constain": false,
                  "hintText": "Ex.0123456789"
                },
                "isVisible": false,
                "keyboardType": "number",
                "maxLines": 1,
                "minLines": 1,
                "style": {
                  "colorTheme": "#FF323232",
                  "decoration": "none",
                  "fontFamily": "Roboto",
                  "fontSize": 14,
                  "fontStyle": "normal",
                  "fontWeight": "w400",
                  "letterSpacing": 0.3,
                  "textTheme": null
                },
                "width": "200"
              },
            },
            {
              "id": "6",
              "type": "textfield",
              "props": {
                "alignment": "center",
                "constain": false,
                "format": "{\"phoneFormat\":\"##########\"}",
                "height": "32",
                "inputDecoration": {
                  "borderRadius": {
                    "bottomLeft": 4,
                    "bottomRight": 4,
                    "constain": false,
                    "topLeft": 4,
                    "topRight": 4
                  },
                  "borderType": "outline",
                  "borderstyle": {"colorTheme": "#00FFFFFF", "width": 1},
                  "colorTheme": "#00FFFFFF",
                  "constain": false,
                  "hintText": "Ex.0123456789"
                },
                "isVisible": false,
                "keyboardType": "phone",
                "maxLines": 1,
                "minLines": 1,
                "style": {
                  "colorTheme": "#FF323232",
                  "decoration": "none",
                  "fontFamily": "Roboto",
                  "fontSize": 14,
                  "fontStyle": "normal",
                  "fontWeight": "w400",
                  "letterSpacing": 0.3,
                  "textTheme": null
                },
                "width": "200"
              },
            },
            {
              "id": "7",
              "type": "textfield",
              "props": {
                "alignment": "center",
                "constain": false,
                "height": "32",
                "inputDecoration": {
                  "borderRadius": {
                    "bottomLeft": 4,
                    "bottomRight": 4,
                    "constain": false,
                    "topLeft": 4,
                    "topRight": 4
                  },
                  "borderType": "outline",
                  "borderstyle": {"colorTheme": "#FF323232", "width": 1},
                  "colorTheme": "#00FFFFFF",
                  "constain": false,
                  "hintText": "Enter your url"
                },
                "keyboardType": "url",
                "maxLines": 1,
                "minLines": 1,
                "style": {
                  "colorTheme": "#FF323232",
                  "decoration": "none",
                  "fontFamily": "Roboto",
                  "fontSize": 14,
                  "fontStyle": "normal",
                  "fontWeight": "w400",
                  "letterSpacing": 0.3,
                  "textTheme": null
                },
                "width": "200"
              },
            },
            {
              "id": "8",
              "type": "textfield",
              "props": {
                "alignment": "center",
                "constain": false,
                "height": "32",
                "inputDecoration": {
                  "borderRadius": {
                    "bottomLeft": 4,
                    "bottomRight": 4,
                    "constain": false,
                    "topLeft": 4,
                    "topRight": 4
                  },
                  "borderType": "outline",
                  "borderstyle": {"colorTheme": "#FF323232", "width": 1},
                  "colorTheme": "#00FFFFFF",
                  "constain": false,
                  "hintText": "Enter your password"
                },
                "isVisible": true,
                "keyboardType": "visiblePassword",
                "maxLines": 1,
                "minLines": 1,
                "style": {
                  "colorTheme": "#FF323232",
                  "decoration": "none",
                  "fontFamily": "Roboto",
                  "fontSize": 14,
                  "fontStyle": "normal",
                  "fontWeight": "w400",
                  "letterSpacing": 0.3,
                  "textTheme": null
                },
                "width": "200"
              },
            },
          ],
        }
      }
    },
  },
  {
    "title": "OWPageView",
    "data": {
      "id": "f3c868b7-d0b5-482b-92ac-b849a7e47bd3",
      "type": "scaffold",
      "props": {"colorTheme": "#FFF4F4F4"},
      "body": {
        "id": "1",
        "type": "pageview",
        "props": {
          "width": "500",
          "height": "500",
          "pageSnapping": true,
          "reverse": false,
          "scrollDirection": "horizontal"
        },
        "children": [
          {
            "id": "2",
            "type": "pageviewpage",
            "child": {
              "id": "3",
              "type": "image",
              "props": {
                "image": Env.backendURL + "/images/default.png",
                "width": "100",
                "height": "100",
                "fit": "cover",
                "constain": false,
                "borderRadius": {
                  "constain": false,
                  "topLeft": 0.0,
                  "topRight": 0.0,
                  "bottomLeft": 0.0,
                  "bottomRight": 0.0,
                },
              },
            }
          },
          {
            "id": "5",
            "type": "pageviewpage",
            "child": {
              "id": "6",
              "type": "image",
              "props": {
                "image": Env.backendURL + "/images/default.png",
                "width": "100",
                "height": "100",
                "fit": "cover",
                "constain": false,
                "borderRadius": {
                  "constain": false,
                  "topLeft": 0.0,
                  "topRight": 0.0,
                  "bottomLeft": 0.0,
                  "bottomRight": 0.0,
                },
              },
            }
          },
        ]
      }
    },
  },
  {
    "title": "CustomIcons",
    "data": {
      "id": "8159acf3-ad61-4bce-bd66-c6f473a6ec6a",
      "type": "scaffold",
      "props": {
        "padding": 20,
        "colorTheme": {
          "colorStyleThemeID": "448a29dd-8200-4506-b58a-4a7f14a79173",
          "color": "#FFF4F4F4",
        }
      },
      "body": {
        "id": "89de3627-6599-4eeb-b39c-2440cdd48545",
        "type": "column",
        "props": {
          "crossAxis": "center",
          "mainAxis": "spaceEvenly",
          "mainAxisSize": "max",
          "scrolling": false,
          "alignment": "center"
        },
        "children": [
          {
            "id": "b54f8713-d2ed-4fa2-92dd-a2d9b41d6ddd",
            "type": "icon",
            "props": {
              "icon": {
                "data":
                    "{\"appId\":\"af4a791d-4dc6-5ab4-addd-3d7e57e860ac\",\"fileId\":\"6a099ddc-70e0-4bd7-ab5b-dd3ea21525f3\",\"fileName\":\"LineariconsIcons.ttf\",\"iconData\":{\"codePoint\":\"0x0E800\",\"fontFamily\":\"LineariconsIcons\"}}",
                "size": 36,
                "theme": "regular",
                "iconType": "customs",
              },
              "colorTheme": {
                "color": "#FF212121",
              },
            },
          },
          {
            "id": "b54f8713-d2ed-4fa2-92dd-a2d9b41d6daa",
            "type": "icon",
            "props": {
              "icon": {
                "data":
                    "{\"appId\":\"af4a791d-4dc6-5ab4-addd-3d7e57e860ac\",\"fileId\":\"6a099ddc-70e0-4bd7-ab5b-dd3ea21525f3\",\"fileName\":\"drop\",\"iconData\":{\"codePoint\":\"0x0E804\",\"fontFamily\":\"LineariconsIcons\"}}",
                "iconType": "customs",
                "size": 36,
                "theme": "regular"
              },
              "colorTheme": {
                "color": "#FF212121",
              },
            },
          }
        ]
      }
    },
  },
  {
    "title": "AppBar",
    "data": {
      "id": "f3c868b7-d0b5-482b-92ac-b849a7e47bd3",
      "type": "scaffold",
      "props": {
        "colorTheme": {
          "color": "#FFF4F4F4",
        }
      },
      "appBar": {
        "actions": [
          {
            "id": "9d184813-5ce1-4565-a188-ed175d2c77d8",
            "props": {
              "colorTheme": {"color": "#FF212121"},
              "icon": {
                "colorTheme": null,
                "data": "more_vertical",
                "size": 24,
                "theme": "regular"
              }
            },
            "title": "icon",
            "type": "icon"
          }
        ],
        "appbarTitle": {
          "id": "e5e3b2a7-3701-4650-8778-5a209a5eea06",
          "props": {
            "data": "Title",
            "maxLines": "1",
            "softWrap": true,
            "style": {
              "colorTheme": {"color": "#FF323232"},
              "decoration": "none",
              "fontFamily": "Roboto",
              "fontSize": 22,
              "fontStyle": "normal",
              "fontWeight": "w600",
              "letterSpacing": 0.3
            },
            "textAlign": "left"
          },
          "title": "text",
          "type": "text"
        },
        "id": "34a724e8-89e9-4d3a-b92d-a20a9138b5c0",
        "props": {
          "centerTitle": false,
          "colorTheme": "#FFFFFFFF",
          "elevation": 0,
          "showDefaultButton": true
        },
        "title": "appbar",
        "type": "appbar"
      },
      "body": {
        "id": "8b2f49b0-ef81-4a3a-840d",
        "type": "text",
        "props": {
          "data": "Hello, World!",
          "softWrap": true,
          "maxLines": "1",
          "textAlign": "left",
          "style": {
            "fontFamily": "Abel",
            "fontSize": 34,
            "fontWeight": "w400",
            "letterSpacing": 0.25,
            "fontStyle": "normal",
            "decoration": "none",
          },
          "colorTheme": {
            "color": "#FF800000",
          }
        }
      }
    },
  },
  {
    "title": "Dropdown Widget",
    "data": {
      "id": "f3c868b7-d0b5-482b-92ac-b849a7e47bd3",
      "type": "scaffold",
      "props": {"padding": 20, "colorTheme": "#FFF4F4F4"},
      "body": {
        "id": "d0bdb074-9a48-4ebb-be9d-9742684e9208",
        "type": "padding",
        "props": {"padding": 20},
        "child": {
          "id": "8b2f49b0-ef81-4a3a-840d-a6eafb97a20b",
          "type": "column",
          "props": {
            "crossAxis": "center",
            "mainAxis": "spaceEvenly",
            "mainAxisSize": "max",
            "scrolling": false,
          },
          "children": [
            {
              "id": const Uuid().v4(),
              "type": "dropdown",
              "props": {
                "type": "dropdownButton",
                "dropdownColor": "#FFCBCED5",
                "focusColor": "#FFFFFFDD",
                "style": {
                  "colorTheme": "#FFCBCE00",
                  "decoration": "none",
                  "fontFamily": "Roboto",
                  "fontSize": 24,
                  "fontStyle": "normal",
                  "fontWeight": "w400",
                  "letterSpacing": 0.3,
                  "textTheme": null
                },
              },
              "items": [
                {"id": "items-1", "label": "items-1", "value": "items-1"},
                {"id": "items-2", "label": "items-2", "value": "items-2"},
                {"id": "items-3", "label": "items-3", "value": "items-3"}
              ],
              "initialSelection": {
                "id": const Uuid().v4(),
                "label": "items-1",
                "value": "items-1"
              },
            },
          ],
        },
      },
    },
  },
  {
    "title": "ExpansionTile",
    "data": {
      "id": "f3c868b7-d0b5-482b-92ac-b849a7e47bd3",
      "type": "scaffold",
      "props": {"colorTheme": "#FFF4F4F4"},
      "body": {
        "id": "1",
        "type": "expansionTile",
        "expansionTileTitle": {
          "id": "f1c868b7-d0b5-482b-92ac-b849a7e47bd3",
          "type": "text",
          "title": "expansionTileTitle",
          "props": {
            "data": "ExpansionTile",
            "softWrap": true,
            "maxLines": "1",
            "style": {
              "fontFamily": "Roboto",
              "fontSize": 18.0,
              "fontWeight": "w600",
              "letterSpacing": 0.3,
              "fontStyle": "normal",
              "decoration": "none",
              "colorTheme": "#FFFFFFFF",
            },
            "textAlign": "left",
          },
        },
        "expansionTileSubTitle": {
          "id": "f1c868b6-d0b5-482b-92ac-b849a7e47bd3",
          "type": "text",
          "title": "expansionTileSubTitle",
          "props": {
            "data": "Trailing expansion arrow icon",
            "softWrap": true,
            "maxLines": "1",
            "style": {
              "fontFamily": "Roboto",
              "fontSize": 14.0,
              "fontWeight": "w400",
              "letterSpacing": 0.3,
              "fontStyle": "normal",
              "decoration": "none",
              "colorTheme": "#FFFFFFFF",
            },
            "textAlign": "left",
          },
        },
        "children": [
          {
            "id": "1",
            "type": "text",
            "props": {
              "data": "This is tile number 1",
              "softWrap": true,
              "maxLines": "1",
              "textAlign": "left",
              "style": {
                "fontFamily": "Abel",
                "fontSize": 16,
                "fontWeight": "w400",
                "letterSpacing": 0.25,
                "fontStyle": "normal",
                "decoration": "none",
                "colorTheme": "#FF800000"
              },
            }
          },
          {
            "id": "2",
            "type": "text",
            "props": {
              "data": "This is tile number 2",
              "softWrap": true,
              "maxLines": "1",
              "textAlign": "left",
              "style": {
                "fontFamily": "Abel",
                "fontSize": 16,
                "fontWeight": "w400",
                "letterSpacing": 0.25,
                "fontStyle": "normal",
                "decoration": "none",
                "colorTheme": "#FF800000"
              },
            }
          },
        ],
        "props": {
          "backgroundColor": "#FF323232",
          "collapsedBackgroundColor": "#FFFF0000",
          "controlAffinity": "leading",
          "isExpand": true
        },
      }
    },
  },
  {
    "title": "Checkbox Widget",
    "data": {
      "id": "f3c868b7-d0b5-482b-92ac-b849a7e47bd3",
      "type": "scaffold",
      "props": {"padding": 20, "colorTheme": "#FFF4F4F4"},
      "body": {
        "id": "89de3627-6599-4eeb-b39c-2440cdd48545",
        "type": "padding",
        "props": {"padding": 20},
        "child": {
          "id": "97f86aea-a14a-4894-b4d8-c72ee003b474",
          "type": "column",
          "props": {
            "crossAxis": "center",
            "mainAxis": "spaceAround",
            "mainAxisSize": "max",
            "scrolling": false,
          },
          "children": [
            {
              "id": const Uuid().v4(),
              "type": "checkbox",
              "title": "checkbox",
              "props": {
                "value": false,
                "activeColor": "#FF323232",
                "checkColor": "#FFFFFFFF",
                "outlinedBorder": {
                  "constain": false,
                  "topLeft": 3.0,
                  "topRight": 3.0,
                  "bottomLeft": 3.0,
                  "bottomRight": 3.0,
                },
                "borderSide": {
                  "color": "#FF323232",
                  "width": 1.0,
                },
              },
            }
          ],
        },
      }
    },
  },
  {
    "title": "ListTile Widget",
    "data": {
      "id": const Uuid().v4(),
      "listTileLeading": {
        "id": const Uuid().v4(),
        "props": {
          "colorTheme": "#FF323232",
          "icon": {
            "data": "add",
            "iconType": "fluent",
            "size": 36,
            "theme": "regular"
          }
        },
        "title": "ListTile Leading",
        "type": "icon"
      },
      "listTileTitle": {
        "id": const Uuid().v4(),
        "props": {
          "data": "Text",
          "maxLines": "1",
          "softWrap": true,
          "style": {
            "colorTheme": "#FF323232",
            "decoration": "none",
            "fontFamily": "Roboto",
            "fontSize": 14,
            "fontStyle": "normal",
            "fontWeight": "w400",
            "letterSpacing": 0.3
          },
          "textAlign": "left"
        },
        "title": "ListTile Title",
        "type": "text"
      },
      "props": {},
      "title": "listTile",
      "type": "listTile"
    },
  },
  {
    "title": "CheckboxListtile Widget",
    "data": {
      "id": "f3c868b7-d0b5-482b-92ac-b849a7e47111",
      "type": "scaffold",
      "props": {"padding": 20, "colorTheme": "#FFF4F4F4"},
      "body": {
        "id": "89de3627-6599-4eeb-b39c-2440cdd48123",
        "type": "padding",
        "props": {"padding": 20},
        "child": {
          "id": "97f86aea-a14a-4894-b4d8-c72ee003b321",
          "type": "column",
          "props": {
            "crossAxis": "center",
            // "mainAxis": "spaceAround",
            "mainAxisSize": "max",
            "scrolling": false,
          },
          "children": [
            {
              "id": "id-checkboxlisttile",
              "type": "checkboxlisttile",
              "title": "checkboxlisttile",
              "checkboxlisttileTitle": {
                "id": "id-title",
                "type": "text",
                "title": "checkboxlisttileTitle",
                "props": {
                  "data": "title 1",
                  "softWrap": true,
                  "maxLines": "1",
                  "style": {
                    "fontFamily": "Roboto",
                    "fontSize": 14.0,
                    "fontWeight": "w400",
                    "letterSpacing": 0.3,
                    "fontStyle": "normal",
                    "decoration": "none",
                    "colorTheme": "#FF323232",
                  },
                  "textAlign": "left",
                },
              },
              "props": {
                "controlAffinity": "leading",
                "value": false,
                "activeColor": "#FF000000",
                "checkColor": "#FFFFFFFF",
                "outlinedBorder": {
                  "constain": false,
                  "topLeft": 3.0,
                  "topRight": 3.0,
                  "bottomLeft": 3.0,
                  "bottomRight": 3.0,
                },
                "borderSide": {
                  "color": "#FF000000",
                  "width": 1.0,
                }
              }
            },
            {
              "id": "id-checkboxlisttile2",
              "type": "checkboxlisttile",
              "title": "checkboxlisttile",
              "checkboxlisttileTitle": {
                "id": "id-title",
                "type": "text",
                "title": "checkboxlisttileTitle",
                "props": {
                  "data": "title 2",
                  "softWrap": true,
                  "maxLines": "1",
                  "style": {
                    "fontFamily": "Roboto",
                    "fontSize": 14.0,
                    "fontWeight": "w400",
                    "letterSpacing": 0.3,
                    "fontStyle": "normal",
                    "decoration": "none",
                    "colorTheme": "#FF323232",
                  },
                  "textAlign": "left",
                },
              },
              "checkboxlisttileSubTitle": {
                "id": const Uuid().v4(),
                "props": {
                  "data": "subtitle",
                  "maxLines": "1",
                  "softWrap": true,
                  "style": {
                    "colorTheme": "#FF323232",
                    "decoration": "none",
                    "fontFamily": "Aclonica",
                    "fontSize": 14,
                    "fontStyle": "normal",
                    "fontWeight": "w400",
                    "keyValue": null,
                    "letterSpacing": 0.3,
                    "textTheme": null
                  },
                  "textAlign": "left"
                },
                "title": "text",
                "type": "text"
              },
              "props": {
                "controlAffinity": "leading",
                "value": false,
                "activeColor": "#FF000000",
                "checkColor": "#FFFFFFFF",
                "outlinedBorder": {
                  "constain": false,
                  "topLeft": 3.0,
                  "topRight": 3.0,
                  "bottomLeft": 3.0,
                  "bottomRight": 3.0,
                },
                "borderSide": {
                  "color": "#FF000000",
                  "width": 1.0,
                }
              }
            },
            {
              "id": "id-checkboxlisttile",
              "type": "checkboxlisttile",
              "title": "checkboxlisttile",
              "checkboxlisttileTitle": {
                "id": "id-title",
                "type": "text",
                "title": "checkboxlisttileTitle",
                "props": {
                  "data": "title 1",
                  "softWrap": true,
                  "maxLines": "1",
                  "style": {
                    "fontFamily": "Roboto",
                    "fontSize": 14.0,
                    "fontWeight": "w400",
                    "letterSpacing": 0.3,
                    "fontStyle": "normal",
                    "decoration": "none",
                    "colorTheme": "#FF323232",
                  },
                  "textAlign": "left",
                },
              },
              "checkboxlisttileSubTitle": {
                "id": const Uuid().v4(),
                "props": {
                  "data": "subtitle",
                  "maxLines": "1",
                  "softWrap": true,
                  "style": {
                    "colorTheme": "#FF323232",
                    "decoration": "none",
                    "fontFamily": "Aclonica",
                    "fontSize": 14,
                    "fontStyle": "normal",
                    "fontWeight": "w400",
                    "keyValue": null,
                    "letterSpacing": 0.3,
                    "textTheme": null
                  },
                  "textAlign": "left"
                },
                "title": "text",
                "type": "text"
              },
              "secondary": {
                "id": const Uuid().v4(),
                "props": {
                  "colorTheme": "#FF323232",
                  "icon": {
                    "data": "add",
                    "iconType": "systems",
                    "size": 36,
                    "theme": "regular"
                  }
                },
                "title": "icon",
                "type": "icon"
              },
              "props": {
                "controlAffinity": "leading",
                "value": false,
                "activeColor": "#FF000000",
                "checkColor": "#FFFFFFFF",
                "outlinedBorder": {
                  "constain": false,
                  "topLeft": 3.0,
                  "topRight": 3.0,
                  "bottomLeft": 3.0,
                  "bottomRight": 3.0,
                },
                "borderSide": {
                  "color": "#FF000000",
                  "width": 1.0,
                }
              }
            },
          ],
        },
      },
      'title': 'TabBar Widget',
      'data': {
        'id': 'tabbar-1',
        'type': 'scaffold',
        'props': {'colorTheme': '#FFF4F4F4'},
        'body': {
          'id': '97f86aea-a14a-4894-b4d8-c72ee003b474',
          'type': 'column',
          'props': {
            'crossAxis': 'center',
            'mainAxis': 'spaceAround',
            'mainAxisSize': 'max',
            'scrolling': false,
          },
          'children': [
            {
              "id": "tabbar-1",
              "type": "tabbar",
              "title": "tabbar",
              "children": [
                {
                  "id": "tabs-1",
                  "type": "tabs",
                  "title": "tabs",
                  "tabs": [
                    {
                      "props": {
                        "data": "Tab 1",
                      },
                      "id": "tab-1",
                      "title": "tab",
                      "type": "tab"
                    },
                    {
                      "props": {
                        "data": "Tab 2",
                        'icon': {
                          'id': 'icon2',
                          'type': 'icon',
                          'props': {
                            'alignment': 'center',
                            'icon': {
                              'data': 'add',
                              'size': 14,
                              'theme': 'filled',
                              "iconType": "fluent",
                            },
                            'colorTheme':
                                "{\"default\":{\"primary\":{\"lightMode\":\"#FFB3261E\",\"darkMode\":\"#FFF2B8B5\"}}}",
                          },
                        },
                      },
                      "id": "tab-1",
                      "title": "tab",
                      "type": "tab"
                    }
                  ],
                },
                {
                  "id": "tabbarviews1",
                  "type": "tabbarviews",
                  "title": "tabbarviews",
                  "tabbarviews": [
                    {
                      "children": [
                        {
                          "children": [
                            {
                              "id": "tabbar1",
                              "props": {
                                "data": "Tab 1",
                                "maxLines": "1",
                                "softWrap": true,
                                "style": {
                                  "colorTheme": "#FF323232",
                                  "decoration": "none",
                                  "fontFamily": "Roboto",
                                  "fontSize": 14,
                                  "fontStyle": "normal",
                                  "fontWeight": "w400",
                                  "letterSpacing": 0.3
                                },
                                "textAlign": "left"
                              },
                              "title": "text",
                              "type": "text"
                            }
                          ],
                          "id": "tabbar1",
                          "props": {
                            "crossAxis": "center",
                            "mainAxis": "start",
                            "mainAxisSize": "max",
                            "scrolling": false
                          },
                          "title": "column",
                          "type": "column"
                        }
                      ],
                      "id": "tabbar1",
                      "title": "tabbarview",
                      "type": "tabbarview"
                    },
                    {
                      "children": [
                        {
                          "children": [
                            {
                              "id": "tabbar 2",
                              "props": {
                                "data": "Tab 2",
                                "maxLines": "1",
                                "softWrap": true,
                                "style": {
                                  "colorTheme": "#FF323232",
                                  "decoration": "none",
                                  "fontFamily": "Roboto",
                                  "fontSize": 14,
                                  "fontStyle": "normal",
                                  "fontWeight": "w400",
                                  "letterSpacing": 0.3
                                },
                                "textAlign": "left"
                              },
                              "title": "text",
                              "type": "text"
                            }
                          ],
                          "id": "tabbar1",
                          "props": {
                            "crossAxis": "center",
                            "mainAxis": "start",
                            "mainAxisSize": "max",
                            "scrolling": false
                          },
                          "title": "column",
                          "type": "column"
                        }
                      ],
                      "id": "tabbar1",
                      "title": "tabbarview",
                      "type": "tabbarview"
                    }
                  ],
                },
              ],
              "props": {
                "isScroll": false,
                "indicatorColor": "#FF87CEEB",
                "dividerColor": "#FF87CEEB",
                "labelColor": "#FF000080",
                "labelStyle": {
                  'fontFamily': 'Abel',
                  'fontSize': 20,
                  'fontWeight': 'w400',
                  'letterSpacing': 0.25,
                  'fontStyle': 'normal',
                  'decoration': 'none',
                },
                "unselectedColor": "#FFFFFF00",
              },
            }
          ],
        },
      },
    },
  },
  {
    'title': 'RadioListtile Widget',
    'data': {
      "id": "id-radiolisttile",
      "items": [
        {"id": "id-radiolisttile1", "label": "item 1", "value": "item 1"},
        {"id": "id-radiolisttile2", "label": "item 2", "value": "item 2"},
        {"id": "id-radiolisttile3", "label": "item 3", "value": "item 3"},
      ],
      "props": {
        "radioStyle": {"activeColor": "#FFCD1919"},
        "titleStyle": {
          "colorTheme": "#FFA11313",
          "decoration": "lineThrough",
          "fontFamily": "Abhaya Libre",
          "fontSize": 14,
          "fontStyle": "normal",
          "fontWeight": "normal",
          "keyValue": null,
          "letterSpacing": 0.3,
          "textTheme": null
        }
      },
      "title": "radiolisttile",
      "type": "radiolisttile"
    }
  },
  {
    'title': 'Paragraph Widget',
    'data': {
      'id': 'f3c868b7-d0b5-482b-92ac-b849a7e47111',
      'type': 'scaffold',
      'props': {'padding': 20, 'colorTheme': '#FFF4F4F4'},
      'body': {
        'id': '89de3627-6599-4eeb-b39c-2440cdd48123',
        'type': 'padding',
        'props': {'padding': 20},
        'child': {
          'id': '97f86aea-a14a-4894-b4d8-c72ee003b321',
          'type': 'column',
          'props': {
            'crossAxis': 'center',
            'mainAxisSize': 'max',
            'scrolling': false,
          },
          'children': [
            {
              'id': 'id-paragraph',
              'type': 'text',
              'title': 'paragraph',
              'props': {
                'data':
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum,',
                'softWrap': true,
                'textAlign': 'left',
                'style': {
                  'fontFamily': 'Abel',
                  'fontSize': 18,
                  'fontWeight': 'w400',
                  'letterSpacing': 0.25,
                  'fontStyle': 'normal',
                  'decoration': 'none',
                  'colorTheme': '#FF000000'
                },
              },
            },
          ],
        },
      }
    },
  },
  {
    'title': 'Heading Widget',
    'data': {
      'id': 'f3c868b7-d0b5-482b-92ac-b849a7e47111',
      'type': 'scaffold',
      'props': {'padding': 20, 'colorTheme': '#FFF4F4F4'},
      'body': {
        'id': '89de3627-6599-4eeb-b39c-2440cdd48123',
        'type': 'padding',
        'props': {'padding': 20},
        'child': {
          'id': '97f86aea-a14a-4894-b4d8-c72ee003b321',
          'type': 'column',
          'props': {
            'crossAxis': 'center',
            // 'mainAxis': 'spaceAround',
            'mainAxisSize': 'max',
            'scrolling': false,
          },
          'children': [
            {
              'id': 'id-9742684e9208',
              'type': 'padding',
              'props': {'padding': 20},
              'child': {
                'id': 'id-0e6867805c3b',
                'type': 'center',
                'child': {
                  'id': 'id-heading',
                  'type': 'heading',
                  'title': 'heading',
                  'props': {
                    'data': 'Hello, Example!',
                    'softWrap': true,
                    'maxLines': '1',
                    'textAlign': 'left',
                    'style': {
                      'fontFamily': 'Abel',
                      'fontSize': 34,
                      'fontWeight': 'w400',
                      'letterSpacing': 0.25,
                      'fontStyle': 'normal',
                      'decoration': 'none',
                      'colorTheme': '#FF000000',
                      "textTheme": "headline5",
                    },
                  }
                }
              }
            },
            {
              'id': 'id-9742',
              'type': 'padding',
              'props': {'padding': 20},
              'child': {
                'id': 'id-0e6',
                'type': 'center',
                'child': {
                  'id': 'id-heading2',
                  'type': 'text',
                  'title': 'heading',
                  'props': {
                    'data': 'Text Heading',
                    'softWrap': true,
                    'maxLines': '1',
                    'textAlign': 'left',
                    'style': {
                      'fontFamily': 'Abel',
                      'fontSize': 34,
                      'fontWeight': 'w400',
                      'letterSpacing': 0.25,
                      'fontStyle': 'normal',
                      'decoration': 'none',
                      'colorTheme': '#FF000000',
                      "textTheme": "headline3",
                    },
                  }
                }
              }
            }
          ],
        },
      }
    },
  }
];
