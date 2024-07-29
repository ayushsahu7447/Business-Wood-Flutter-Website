class Item {
  String image;
  String title;
  String subtitle;
  String description;
  String price;

  Item({
    required this.image,
    required this.title,
    required this.subtitle,
    required this.description,
    required this.price,
  });
}

List<Item> items = [
  Item(
    image:'https://images.unsplash.com/photo-1542744173-05336fcc7ad4?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=802&q=80',
    title: 'Social Media Management',
    subtitle: 'grows social platforms audience / network',
    description:
    'Elevate your brands impact on social platforms with our data-driven strategies, mastered by our experts.',
  price: 'Buzz boosters network',
  ),
  Item(
    image: 'https://images.unsplash.com/photo-1558655146-9f40138edfeb?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=464&q=80'
    ,title: 'Logo Designing',
    subtitle: 'Created logo that reflects brand personal',
    description:
    'Unleash your brands essence with us by creating captivating logos that leave a lasting, meaningful impression.',
    price: 'Artistic mark designs',
  ),
  Item(
    image:'https://images.unsplash.com/photo-1598367815092-a2c0cbc1ea3d?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=387&q=80',
    title: 'Graphic Designing',
    subtitle: 'Creates impactful designs',
    description:'From eye-catching marketing materials to a distinctive brand identity, we bring your vision to life with expertise.',
    price: 'DesignDazzle Creations',
  ),
  Item(
    image: 'https://images.unsplash.com/photo-1556761175-129418cb2dfe?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=774&q=80',
    title: 'Podcast Shoot',
    subtitle: 'Captures your voice through Podcast',
    description: 'Our collaborative approach ensures that we capture the authenticity of your podcast, making your viewers feel like they are part of the conversation. ',
    price: 'Podflicks productions',
  ),
  Item(
    image:'https://images.unsplash.com/photo-1528109966604-5a6a4a964e8d?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=987&q=80',
    title: 'Short Video Shots',
    subtitle: 'Covers strong messages in a few Seconds',
    description:'Our Meticulously crafted short videos evoke emotions, convey powerful messages, and drive action among audiences',
    price: 'Mini motions Shots',
  ),
  Item(
    image: 'https://images.unsplash.com/photo-1485846234645-a62644f84728?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8OXx8bG9uZyUyMHZpZGVvJTIwc2hvb3R8ZW58MHx8MHx8fDA%3D&auto=format&fit=crop&w=900&q=60',
    title: 'Long Play Video',
    subtitle: 'Covers every inch of the story',
    description:'Delight in our partnership, as we create immersive long-form visual experiences for you that leave a lasting impression.',
    price: 'LongPlay Films',
  ),
  Item(
    image:'https://images.unsplash.com/photo-1682078234868-412ec5566118?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8OHx8cHJvZHVjdCUyMHZpZGVvJTIwc2hvb3Rpbmd8ZW58MHx8MHx8fDA%3D&auto=format&fit=crop&w=900&q=60',
    title: 'Product Glimpse shoot',
    subtitle: 'Covers result in detail from every Angle',
    description:' Our goal is to showcase your products features, quality, and craftsmanship, through our lens in most attracting way.',
    price: 'Product Featuring',
  ),
  Item(
    image: 'https://images.unsplash.com/photo-1552664730-d307ca884978?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8b2ZmaWNlJTIwdGVhbSUyMHdvcmt8ZW58MHx8MHx8fDA%3D&auto=format&fit=crop&w=900&q=60',
    title: 'Brand Backstory Shoot',
    subtitle: 'Unveiling the stories shaped the identity',
    description: 'We are passionate about storytelling and understand that a brands backstory is what connects with its audience on a personal and emotional level',
    price: 'Roots Reveal Cast',
  ),
];