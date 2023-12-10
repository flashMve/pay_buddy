final List<Map<String, dynamic>>? userData = [
  {'name': 'Abrar', 'amount': 500, 'url': "assets/demo_data/demo1.jpeg"},
  {'name': 'Subtain', 'amount': 300, 'url': "assets/demo_data/demo1.jpeg"},
  {'name': 'Anan', 'amount': 400, 'url': "assets/demo_data/demo1.jpeg"},
  {'name': 'Hassan', 'amount': 500, 'url': "assets/demo_data/demo1.jpeg"},
  {'name': 'Hannan', 'amount': 5200, 'url': "assets/demo_data/demo1.jpeg"},
  {'name': 'Husnain', 'amount': 50000, 'url': "assets/demo_data/demo1.jpeg"},
  {'name': 'Usama', 'amount': 600, 'url': "assets/demo_data/demo1.jpeg"},
  {'name': 'Danny', 'amount': 800, 'url': "assets/demo_data/demo1.jpeg"},
  {'name': 'Wasiq', 'amount': 3000, 'url': "assets/demo_data/demo1.jpeg"},
  {'name': 'Bilal', 'amount': 900, 'url': "assets/demo_data/demo1.jpeg"},
  {
    'name': 'Arslan Bhatti',
    'amount': 1000,
    'url': "assets/demo_data/demo1.jpeg"
  }
];

final Map<String, List<Map<String, dynamic>>>? spentHistory = {
  "${DateTime.now().year}-${DateTime.now().month}-${DateTime.now().day}": [
    {'name': 'Abrar', 'amount': 500, 'url': "assets/demo_data/demo1.jpeg"},
    {'name': 'Abrar', 'amount': 500, 'url': "assets/demo_data/demo1.jpeg"},
    {'name': 'Abrar', 'amount': 500, 'url': "assets/demo_data/demo1.jpeg"}
  ],
  "${DateTime(2021, 8, 26).year}-${DateTime(2021, 8, 26).month}-${DateTime(2021, 8, 26).day}":
      [
    {'name': 'Subtain', 'amount': 300, 'url': "assets/demo_data/demo1.jpeg"},
  ],
  "${DateTime(2021, 8, 27).year}-${DateTime(2021, 8, 27).month}-${DateTime(2021, 8, 27).day}":
      [
    {'name': 'Anan', 'amount': 400, 'url': "assets/demo_data/demo1.jpeg"},
  ],
  "${DateTime(2021, 8, 29).year}-${DateTime(2021, 8, 29).month}-${DateTime(2021, 8, 29).day}":
      [
    {'name': 'Hassan', 'amount': 500, 'url': "assets/demo_data/demo1.jpeg"},
  ],
  "${DateTime(2021, 9, 28).year}-${DateTime(2021, 8, 28).month}-${DateTime(2021, 8, 28).day}":
      [
    {'name': 'Hannan', 'amount': 5200, 'url': "assets/demo_data/demo1.jpeg"},
  ],
};
