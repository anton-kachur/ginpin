class userAccount {
  var userData = {
    'username': '',
    'name': '',
    'bio': '',
    'email': '' 
  };
  
  var isAdmin = false;
  var boards;
  var subscribers;
  var subscribes;


  @override
  String toString() { 
    if (isAdmin) {
      return '\nMy account: \n$userData\n $boards \n\nSubscribers\' info: \n$subscribers \n\nSubscriptions\' info: \n$subscribes';
    } else {
      return '\n$userData';
    }
  }

  // Overloaded operator for adding subscriptions
  operator +(userAccount acc) {
    subscribes.add(acc);
  }


  /* Getters & setters */
  bool? get IsAdmin => isAdmin;
  String? get Username => userData['username'] ?? 'No username defined';
  String get Name => userData['name'] ?? 'No name defined';
  String get Bio => userData['bio'] ?? 'No bio defined';
  String get Email => userData['email'] ?? 'No email defined';
  Set get Boards => boards ?? 'User ${userData['username']} has no boards yet';
  Set get Subscribers => subscribers ?? 'User ${userData['username']} has no subscribers yet';
  Set get Subscribes => subscribes ?? 'User ${userData['username']} has no subscriptions yet';
  
  set newAdmin (bool val) => isAdmin = val;
  set newUserName (String val) => userData['username'] = val;
  set newName (String val) => userData['name'] = val;
  set newBio (String val) => userData['bio'] = val;
  set newEmail (String val) => userData['email'] = val;
  set newBoardsBySet (Set val) => boards = val;
  set newBoardsByObject (Board val) => boards = val;
  set newSubscribersBySet (Set val) => subscribers = val;
  set newSubscribersByObject (userAccount val) => subscribers = val;
  set newSubscribesBySet (Set val) => subscribes = val;
  set newSubscribesByObject (userAccount val) => subscribers = val;


  /* Initialization list, default, named and factory constructors */
  userAccount();
  userAccount.init(var admin, var data, {var boards, var subscribers, var subscribes}): 
              isAdmin = admin, 
              userData = data,
              boards = boards,
              subscribers = subscribers,
              subscribes = subscribes;
               
  userAccount.named(this.isAdmin, this.userData, {this.boards, this.subscribers, this.subscribes});

  userAccount.fromMap(var admin, var map, {this.boards, this.subscribers, this.subscribes}) {
    isAdmin = admin;

    for (var item in map.entries) {
      userData[item.key] = map[item.value];  
    }
  }

}



class Board {
  var boardName;
  var content;

  @override
  String toString() => '\nBoard: $boardName;\nContent: $content';

  // Function which adds new media content to board
  void createPin(var pin, [bool root = false]) {
    if (root) {
      content.add(pin);
      print('Pin created!');
    } else {
      print("Error! You can't edit the boards of other users!");
    }
  }

  // Function which checks if user has admin roots
  bool getRoot(userAccount user) => (user.IsAdmin == true) ? true : false;

  /* Getters & setters */
  String get BoardName => boardName;
  Set get Content => content;
  set newBoardName (String val) => boardName = val;
  set newContent (Set val) => content = val;


  /* Default, named constructors */
  Board();
  Board.named(this.boardName, this.content);

}



class Content {
  var contentData = {
    'type': '',
    'name': '',
    'resolution': '',
    'size': 0.0,
    'author': ''
  };

  var comments;
  var likes;

  @override
  String toString() => '\n  Content data: $contentData;\n  Likes: ${likes ?? '0'}\n  Comments: ${comments ?? 'No comments yet'}';

  // Function, which increases something, i.e. likes 
  Function more(num n) {
    return (int i) => i*n;
  }


  /* Getters & setters */
  Map<String, Object> get ContentData => contentData;
  List get Comments => comments ?? 'No comments yet';
  int get Likes => likes ?? 'No likes yet';
  set newContentData (Map<String, Object> val) => contentData = val;
  set newComments (List val) => comments = val;
  set newLikes (int val) => likes = val;


  /* Default, named constructors */
  Content();
  Content.named(this.contentData, {this.likes});

  Content.fromMap(var map, {this.likes}) {
    for (var item in map.entries) {
      contentData[item.key] = map[item.value];  
    }
  }

}



class App {
  userAccount myAcc;
  static App app = App.fromAccount(userAccount());


  @override
  String toString() => 'Your account: ${myAcc.Username}';

  /* Getters & setters */
  App? get MyApp => app;
  userAccount get MyAccount => myAcc;
  set newApp (App val) => app = val;
  set newMyAccount (userAccount val) => myAcc = val;


  /* Default and factory constructor */
  App.fromAccount(this.myAcc);

  factory App(var username) {
    print('\nYour account before signing in/up: ${app.myAcc.Username}');
    // Signing in/up
    if (app.myAcc.Username == '') {
      app.myAcc.newUserName = username;
    }

    return app;
  }
  
}