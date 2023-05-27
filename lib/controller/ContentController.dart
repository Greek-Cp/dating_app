import 'package:dating_app/model/ModelIntro.dart';
import 'package:get/get.dart';

import '../model/ModelDiscoveryPeople.dart';

class ContentController extends GetxController {
  List<ModelIntro> listDataIntro = [
    ModelIntro(
      "Algorithm",
      "Users going through a vetting process to ensure you never match with bots.",
      "https://plus.unsplash.com/premium_photo-1671586882920-8cd59c84cdfe?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTl8fGdpcmx8ZW58MHx8MHx8fDA%3D&auto=format&fit=crop&w=500&q=60",
    ),
    ModelIntro(
      "Matches",
      "We match you with people that have a large array of similar interests.",
      "https://images.unsplash.com/photo-1514315384763-ba401779410f?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mjd8fGdpcmx8ZW58MHx8MHx8fDA%3D&auto=format&fit=crop&w=500&q=60",
    ),
    ModelIntro(
      "Premium",
      "Sign up today and enjoy the first month of premium benefits on us.",
      "https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mjh8fGdpcmx8ZW58MHx8MHx8fDA%3D&auto=format&fit=crop&w=500&q=60",
    )
  ].obs;

  List<ModelDiscoveryPeople> listPeople = [
    ModelDiscoveryPeople("Jessica Parker", "Profesional Model", "23", "3km",
        "https://images.unsplash.com/photo-1524504388940-b1c1722653e1?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Nnx8bW9kZWx8ZW58MHx8MHx8fDA%3D&auto=format&fit=crop&w=500&q=60"),
    ModelDiscoveryPeople("Emily Johnson", "Graphic Designer", "28", "5km",
        "https://images.unsplash.com/photo-1529626455594-4ff0802cfb7e?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NXx8bW9kZWx8ZW58MHx8MHx8fDA%3D&auto=format&fit=crop&w=500&q=60"),
    ModelDiscoveryPeople("Sophia Thompson", "Software Engineer", "25", "2km",
        "https://images.unsplash.com/photo-1534528741775-53994a69daeb?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NHx8bW9kZWx8ZW58MHx8MHx8fDA%3D&auto=format&fit=crop&w=500&q=60"),
    ModelDiscoveryPeople(
      "Bella",
      "Doctor",
      "2",
      "2km",
      "https://images.unsplash.com/photo-1601762603339-fd61e28b698a?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MzJ8fGZhc2hpb258ZW58MHx8MHx8fDA%3D&auto=format&fit=crop&w=500&q=60",
    ),
    ModelDiscoveryPeople(
      "Catherine",
      "Software Engineer",
      "3",
      "3km",
      "https://images.unsplash.com/photo-1664575602554-2087b04935a5?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8d29tYW58ZW58MHx8MHx8fDA%3D&auto=format&fit=crop&w=500&q=60",
    ),
    ModelDiscoveryPeople(
      "Danielle",
      "CEO",
      "4",
      "4km",
      "https://images.unsplash.com/photo-1581044777550-4cfa60707c03?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8OHx8ZmFzaGlvbnxlbnwwfHwwfHx8MA%3D%3D&auto=format&fit=crop&w=500&q=60",
    ),
    ModelDiscoveryPeople(
      "Emily",
      "Profession 5",
      "Age 5",
      "Distance 5",
      "https://images.unsplash.com/photo-1529139574466-a303027c1d8b?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NHx8ZmFzaGlvbnxlbnwwfHwwfHx8MA%3D%3D&auto=format&fit=crop&w=500&q=60",
    ),
    ModelDiscoveryPeople("Olivia Wilson", "Photographer", "30", "8km",
        "https://plus.unsplash.com/premium_photo-1674069719655-7289402d71e9?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8N3x8bW9kZWx8ZW58MHx8MHx8fDA%3D&auto=format&fit=crop&w=500&q=60"),
    ModelDiscoveryPeople("Ava Anderson", "Fashion Designer", "26", "4km",
        "https://images.unsplash.com/photo-1621784563330-caee0b138a00?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NTB8fG1vZGVsfGVufDB8fDB8fHww&auto=format&fit=crop&w=500&q=60"),
    ModelDiscoveryPeople("Mia Thompson", "Marketing Specialist", "27", "6km",
        "https://images.unsplash.com/photo-1621086893822-ca4d5a70bf36?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NjZ8fG1vZGVsfGVufDB8fDB8fHww&auto=format&fit=crop&w=500&q=60"),
    ModelDiscoveryPeople("Lily Davis", "Architect", "24", "1km",
        "https://images.unsplash.com/photo-1524504542391-127872011665?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTAxfHxtb2RlbHxlbnwwfHwwfHx8MA%3D%3D&auto=format&fit=crop&w=500&q=60"),
    ModelDiscoveryPeople("John Doe", "Actor", "32", "2km",
        "https://images.unsplash.com/photo-1639526658732-ac7fdbfcf4db?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NDZ8fGhpamFifGVufDB8fDB8fHww&auto=format&fit=crop&w=500&q=60"),
    ModelDiscoveryPeople("Jane Smith", "Artist", "29", "7km",
        "https://images.unsplash.com/photo-1574297500578-afae55026ff3?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8OXx8aGlqYWJ8ZW58MHx8MHx8fDA%3D&auto=format&fit=crop&w=500&q=60"),
    ModelDiscoveryPeople("Michael Johnson", "Fitness Trainer", "31", "4km",
        "https://images.unsplash.com/photo-1571423483570-eb27018d1ec0?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MzR8fGFzaWElMjBnaXJsfGVufDB8fDB8fHww&auto=format&fit=crop&w=500&q=60"),
    ModelDiscoveryPeople("Emily Brown", "Musician", "27", "6km",
        "https://images.unsplash.com/photo-1622651795594-aabc6cf90a54?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MzV8fGhpamFifGVufDB8fDB8fHww&auto=format&fit=crop&w=500&q=60"),
    ModelDiscoveryPeople("Daniel Davis", "Chef", "35", "3km",
        "https://images.unsplash.com/photo-1475823678248-624fc6f85785?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MjB8fGFzaWElMjBnaXJsfGVufDB8fDB8fHww&auto=format&fit=crop&w=500&q=60"),
    ModelDiscoveryPeople("Olivia Wilson", "Interior Designer", "30", "8km",
        "https://images.unsplash.com/photo-1534528741775-53994a69daeb?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NHx8bW9kZWx8ZW58MHx8MHx8fDA%3D&auto=format&fit=crop&w=500&q=60"),
    ModelDiscoveryPeople("David Martinez", "Doctor", "38", "5km",
        "https://plus.unsplash.com/premium_photo-1674069719655-7289402d71e9?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8N3x8bW9kZWx8ZW58MHx8MHx8fDA%3D&auto=format&fit=crop&w=500&q=60"),
    ModelDiscoveryPeople("Sophie Johnson", "Fashion Stylist", "26", "4km",
        "https://images.unsplash.com/photo-1621784563330-caee0b138a00?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NTB8fG1vZGVsfGVufDB8fDB8fHww&auto=format&fit=crop&w=500&q=60"),
    ModelDiscoveryPeople("Liam Wilson", "Photographer", "29", "6km",
        "https://images.unsplash.com/photo-1621086893822-ca4d5a70bf36?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NjZ8fG1vZGVsfGVufDB8fDB8fHww&auto=format&fit=crop&w=500&q=60"),
    ModelDiscoveryPeople("Emma Davis", "Software Engineer", "24", "1km",
        "https://images.unsplash.com/photo-1524504542391-127872011665?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTAxfHxtb2RlbHxlbnwwfHwwfHx8MA%3D%3D&auto=format&fit=crop&w=500&q=60"),
    ModelDiscoveryPeople("Matthew Wilson", "Architect", "32", "3km",
        "https://images.unsplash.com/photo-1541182388496-ac92a3230e4c?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTMwfHxtb2RlbHxlbnwwfHwwfHx8MA%3D%3D&auto=format&fit=crop&w=500&q=60"),
    ModelDiscoveryPeople("Sophia Thompson", "Graphic Designer", "27", "5km",
        "https://images.unsplash.com/photo-1526413232644-8a40f03cc03b?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTU2fHxtb2RlbHxlbnwwfHwwfHx8MA%3D%3D&auto=format&fit=crop&w=500&q=60"),
    ModelDiscoveryPeople("Ethan Davis", "Marketing Specialist", "28", "2km",
        "https://images.unsplash.com/photo-1534083220759-4c3c00112ea0?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8OXx8YXNpYSUyMGdpcmx8ZW58MHx8MHx8fDA%3D&auto=format&fit=crop&w=500&q=60")
  ].obs;
  List<ModelDiscoveryPeople> getModelDiscoveryPeople() => listPeople;

  List<ModelIntro> getIntro() => listDataIntro;
}
