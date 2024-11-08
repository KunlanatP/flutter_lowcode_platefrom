# JSON Structure Example

Describe Flutter Widget in JSON

### Dragable and Dropable rules

**Dragable**
Widget can drag.

**Dropable**
Widget can drop should have have child, children or body (Scaffold).

**AppBar**
AppBar should drop inside Page widget and Page widget wrapped Scaffold.

### Page with AppBar and Action

```js
var page = {
  id: "1",
  type: "Page",
  props: {
    name: "Blank Page",
  },
  children: [
    {
      id: "2",
      type: "AppBar",
      props: {
        title: "Counter: ${counter.state}", // use global theme
        actions: [
          {
            id: "3",
            type: "IconButton",
            props: {
              icon: {
                codePoint: 0xe037,
                fontFamily: "MaterialIcons",
                fontPackage: null,
              },
            },
            actions: {
              onPress: {
                type: "counter/incrementBy",
                args: {
                  num: 1,
                },
              },
            },
          },
        ],
      },
    },
    {
      id: "4",
      type: "Container",
      child: {
        id: "5",
        type: "Button",
        child: {
          type: "Text",
          props: {
            data: "Back to prevouis page",
          },
        },
        actions: {
          onPress: {
            type: "navigator/pop",
          },
        },
      },
    },
  ],
};

var actions = {
  counter: {
    init: {
      state: 0,
    },
    incrementBy: {
      parameters: { num: { type: "string?" } },
      flow: [
        {
          type: "start",
        },
        {
          type: "node",
          data: {
            state: "state + num",
          },
        },
        {
          type: "end",
        },
      ],
    },
  },
};
```

### Page with BottomBar

```js
var page = {
  id: "1",
  type: "Page",
  props: {
    name: "BottomBar",
  },
  children: [
    {
      type: "button",
      actions: {
        onPress: {
          type: "userService/fetchAllUser",
        },
      },
    },
  ],
  bottomBarNavigator: {
    type: "appbar",
    items: [
      {
        type: "navbarItem",
        icon: {
          fontFamily: "MaterialIcons",
          fontPackage: null,
        },
      },
      {
        type: "navbarItem",
        icon: {
          fontFamily: "MaterialIcons",
          fontPackage: null,
        },
      },
    ],
  },
};

let actions = {
  userService: {
    init: {
      state: null,
    },
    fetchAllUser: {
      parameters: {
        s: "string?",
        offset: "int?",
        skip: "int?",
      },
      flow: [
        {
          type: "start",
        },
        {
          type: "api",
          options: {
            url: "https://api.example.com/users",
          },
          args: {
            s: "string?",
            offset: "int?",
            skip: "int?",
          },
        },
        {
          type: "end",
        },
      ],
    },
  },
};
```
