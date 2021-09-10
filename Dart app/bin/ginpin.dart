import 'classes.dart';


void main(List<String> arguments) {
  print('<*********************************************************************************>');
  print(' Welcome to GinPin.\n This is a social network, where people can share, save and create media content.\n Hope you enjoy it)\n');
  print(' Author: Anton Kachur');
  print(' Contacts: ...');
  print('<*********************************************************************************>');

  // Create your account (making 'isAdmin' variable true means that it is your account)
  var user_me = userAccount()
    ..isAdmin = true
    ..userData['username'] = '@me'
    ..userData['name'] = 'Anton Kachur'
    ..userData['bio'] = 'Top quality content 24/7. Subscribe me on GinPin later)'
    ..userData['email'] = 'qwerty@gmail.com';
    

  // Of course, there are many other users in GinPin, so let's create some of them
  var user1 = userAccount.named(false, 
                                {'username': '@pro_user', 'name': 'Vasilii Pupkin', 'bio': 'О, тут что-то писать можно?', 'email': ''}, 
                                boards: Null, 
                                subscribers: Null, 
                                subscribes: Null
                               );
  var user2 = userAccount.named(false, {'username': '@just_some_user', 'name': 'Anonim', 'bio': '', 'email': ''});
  
  // All content in your GinPin account is located in sections called 'boards'. Now we can create a new board and add some media to it
  var photo = Content.named({ 'type': 'photo', 'name': 'Mountains', 'resolution': 'png', 'size': 12.4, 'author': '@me'});
  var video = Content.named({ 'type': 'video', 'name': 'LoFi music', 'resolution': 'avi', 'size': 1244.8, 'author': '@lofi_girl'}, likes: 1200);

  // The photo has 0 likes, 500 would be enough
  var likes100 = photo.more(100);
  photo.newLikes = likes100(5);

  var board = Board.named('Inspiration', {photo, video});  

  // As your account was created only with account info, let's add at least one board, some subscribers and subscriptions
  user_me.newBoardsByObject = board;
  user_me.newSubscribersBySet = {user1, user1};
  user_me.newSubscribesBySet = {user1};

  // Add new subscription by overloaded operator +
  user_me + user2;

  // Print your account info
  print(user_me.toString());

  // An example how GinPin app works
  var app = App(user_me.Username);
  print(app.toString());

  // You can edit only your boards. You can prove, that it's your board by proving, that you have rights to edit it
  var photo1 = Content.named({ 'type': 'photo', 'name': 'Forest', 'resolution': 'png', 'size': 4.9, 'author': '@me'}, likes:11);
  print("\nTrying to add new photo to another user's board...");
  board.createPin(photo1);
  board.createPin(photo1, board.getRoot(user_me));
}
