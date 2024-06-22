 
class CategoryLists {
   final String name;
   final List<String > items;

   CategoryLists({
    required this.name,
    this.items = const []
   });


   final itemNames = [
    CategoryLists(
      name: 'Building / Architect',
      items: [
        'Tilers',
        'Manson',
        'Painter',
        'Plumbers',
        'Carpentry',
        'Electricians',
        'Steel Benders',
        'Air Conditioned Engineer',
      ],
      
      ),
      CategoryLists
      (name: 'AutoMobile',
      items: [
        'Car Mechanic',
        'Car Electricians',
        'Car Sprayers',
        'Car Air Conditioner Repairs',
      ]),
 CategoryLists
      (name: 'Domestic Services',
      items: [
        'Cleaner',
        'Laundry',
        'House keeper',
        'Decorator',
      ]),

    
  
   ];
}