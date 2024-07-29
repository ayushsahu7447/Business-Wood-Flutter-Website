class Chef {
  String image;
  String name;
  String designation;
  int index;

  Chef({
    required this.image,
    required this.name,
    required this.designation,
    required this.index,
  });
}

List<Chef> chefs = [
  Chef(
    image:'assets/apiero.jpeg',
    name: 'Apiero Medica Pvt Ltd',
    designation: 'Health-Tech',
    index: 1,
  ),
  Chef(
    image:'assets/apieroit.jpeg',
    name: 'Patel Agro Pvt Ltd',
    designation: 'Agri-Tech',
    index: 2,
  ),
  Chef(
    image:'assets/yourt.jpeg',
    name: 'Yours Trading Pvt Ltd',
    designation: 'IT Company',
    index: 3,
  ),
  Chef(
    image: 'assets/apieroit.jpeg',
    name: 'Apiero Pvt Ltd',
    designation: 'IT Company',
    index: 4,
  ),
  Chef(
    image:'assets/growbio.jpeg',
    name: 'Grow Bio Pvt Ltd',
    designation: 'Agriculture Company',
    index: 5,
  ),
];