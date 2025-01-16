class GalleryItem {
  final String imageTitle;
  final String imageDate;
  final String imageDescription;
  final String imagePath;

  GalleryItem({
    required this.imageTitle,
    required this.imageDate,
    required this.imageDescription,
    required this.imagePath,
  });
}

List<GalleryItem> galleryData = [
  GalleryItem(
    imageTitle: 'Bunter Basketball',
    imageDate: '03.06.2023',
    imageDescription: 'Ein farbenfrohes Basketballfeld im Freien.',
    imagePath: 'assets/images/basketball_1.jpeg',
  ),
  GalleryItem(
    imageTitle: 'Adrenalin pur!',
    imageDate: '14.07.2020',
    imageDescription: 'Ein Skifahrer in voller Montur fliegt mutig über schneebedeckte Hügel.',
    imagePath: 'assets/images/ski.jpeg',
  ),
  GalleryItem(
    imageTitle: 'Achtung Kurve',
    imageDate: '18.06.2022',
    imageDescription: 'Eine große Gruppe Rennradfahrer legt sich synchron in eine scharfe Kurve.',
    imagePath: 'assets/images/bike.jpeg',
  ),
  GalleryItem(
    imageTitle: 'Runners High',
    imageDate: '22.09.2023',
    imageDescription: 'Unsere acht Läufer bewegen sich hier in einer beeindruckenden Formation.',
    imagePath: 'assets/images/running.jpeg',
  ),
  GalleryItem(
    imageTitle: 'Swish',
    imageDate: '11.08.2018',
    imageDescription: 'Ein Foto, das von unten aufgenommen wurde.',
    imagePath: 'assets/images/basketball_2.jpeg',
  ),
  GalleryItem(
    imageTitle: 'Ball Game',
    imageDate: '29.11.2023',
    imageDescription: 'Die Nahaufnahme eines gelb-grünen Tennisballs.',
    imagePath: 'assets/images/tennis_1.jpeg',
  ),
];
