class Users{
  final String name;
  final String email;
  final String password;
  final double contact;
  final String address;

  Users(this.name, this.email, this.password, this.contact, this.address);
}

class NewUser{
  final List<Users> user = [
    Users('omkar', 'omkar@gmail.com', 'dkjfekr', 8302839029, 'ekjeiojkeroek'),
    Users('kdjf', 'dskjek@gmail.com', 'kekkeji', 3439409300, 'erjfkerknkkn'),
    Users('dkfjk', 'dkfjekr@gmail.com', 'kjdpokjk', 0480847938, 'erjkojkookk'),
  ];
}