import 'dart:math';

class TankNames {
  static const List<String> names = [
    'Akim', 'Bjorn', 'Chen', 'Darius', 'Einar', 'Farid', 'Goran', 'Hiroshi',
    'Ilya', 'Jamal', 'Kenta', 'Lars', 'Mateo', 'Nikolai', 'Omar', 'Pavel',
    'Quang', 'Rashid', 'Sven', 'Tariq', 'Umar', 'Viktor', 'Wen', 'Yuri', 'Zoltan',
    'Anya', 'Beatrice', 'Chloe', 'Diana', 'Elena', 'Fatima', 'Giulia', 'Hana',
    'Ingrid', 'Julia', 'Karina', 'Leila', 'Mina', 'Nadia', 'Olga', 'Priya',
    'Qiuyue', 'Rina', 'Sofia', 'Tamara', 'Uma', 'Valeria', 'Wafa', 'Xinyi', 'Yasmin', 'Zara',
    'Arjun', 'Bartosz', 'Carlos', 'Diego', 'Eduardo', 'Filip', 'Gustav', 'Hasan',
    'Ivan', 'Jakub', 'Kenji', 'Luca', 'Mohammed', 'Nino', 'Oleg', 'Petar',
    'Ravi', 'Sami', 'Takumi', 'Ugo', 'Vanya', 'Wiktor', 'Xiang', 'Youssef', 'Zinedine',
    'Aisha', 'Brigita', 'Carmen', 'Daniela', 'Emilia', 'Florence', 'Greta', 'Helena',
    'Irina', 'Jin', 'Katarina', 'Laila', 'Marta', 'Naoko', 'Oksana', 'Patricia',
    'Renata', 'Simona', 'Tanya', 'Ursula', 'Veronica', 'Wanda', 'Xin', 'Yuna', 'Zofia',
  ];

  static final Random _random = Random();

  static String getRandomName() {
    return names[_random.nextInt(names.length)];
  }
}
