class HomeCelebrityModel {
  final String name;
  final String image;
  final String description;
  const HomeCelebrityModel({
    required this.name, 
    required this.image, 
    required this.description,
  });
}

List<HomeCelebrityModel> celebModel = [
  HomeCelebrityModel(
    name: 'Drake',
    image: 'assets/images/celebrity/drake.jpg',
    description: 'Canadian rapper, singer, and songwriter known for hits like "God\'s Plan" and "One Dance". Multi-Grammy winner and one of the best-selling music artists.',
  ),
  HomeCelebrityModel(
    name: "Olamide",
    image: "assets/images/celebrity/olamide1.jpg",
    description: 'Nigerian rapper and singer, pioneer of street-hop music in Nigeria. Known as "Baddo" and founder of YBNL Nation record label.',
  ),
  HomeCelebrityModel(
    image: "assets/images/celebrity/savage.jpg",
    name: "21 Savage",
    description: 'British-American rapper known for his distinctive delivery and hits like "Bank Account" and "A Lot". Grammy-winning artist with a unique trap sound.',
  ),
  HomeCelebrityModel(
    image: "assets/images/celebrity/asake.jpg",
    name: "Asake",
    description: 'Nigerian Afrobeats singer and songwriter signed to YBNL Nation. Known for fusion of Amapiano and Afrobeats with hits like "Sungba" and "Terminator".',
  ),
  HomeCelebrityModel(
    image: "assets/images/celebrity/wizkid.jpeg",
    name: "Wizkid",
    description: 'Nigerian superstar and Afrobeats pioneer. Grammy-winning artist known for "Essence" and collaborations with Drake, Beyoncé, and other global stars.',
  ),
  HomeCelebrityModel(
    name: 'Dave',
    image: 'assets/images/celebrity/dave.jpg',
    description: 'British rapper, singer, and songwriter known for socially conscious lyrics. Mercury Prize and Brit Award winner with hits like "Location" and "Starlight".',
  ),
  HomeCelebrityModel(
    name: "Ruger",
    image: "assets/images/celebrity/ruger.jpg",
    description: 'Nigerian Afrobeats singer signed to Jonzing World. Known for his eye patch style and hits like "Bounce" and "Asiwaju".',
  ),
  HomeCelebrityModel(
    image: "assets/images/celebrity/cench.jpg",
    name: "Central Cee",
    description: 'British rapper from West London known for UK drill and melodic rap. Breakout artist with viral hits like "Doja" and "Sprinter".',
  ),
];