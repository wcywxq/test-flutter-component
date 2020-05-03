class Post {
  const Post({
    this.title,
    this.author,
    this.imgUrl,
  });

  final String title;
  final String author;
  final String imgUrl;
}

final List<Post> posts = [
  Post(
    title: 'post1',
    author: 'mr1',
    imgUrl: 'https://img1.doubanio.com/view/photo/albumcover/public/p2534644818.webp'
  ),
  Post(
    title: 'post2',
    author: 'mr2',
    imgUrl: 'https://img3.doubanio.com/view/photo/albumcover/public/p2496879361.webp'
  ),
  Post(
    title: 'post3',
    author: 'mr3',
    imgUrl: 'https://img9.doubanio.com/view/photo/albumcover/public/p2544435894.webp'
  ),
];