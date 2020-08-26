import './models/todo.dart';
import './models/todo_category.dart';
import '../presentation/values/colors.dart';

const mockCategories = <TodoCategory>[
  TodoCategory(title: '', color: null),
  TodoCategory(title: 'DESIGN', color: category1),
  TodoCategory(title: 'BLOC', color: category2),
  TodoCategory(title: 'LOGIC', color: category3),
  TodoCategory(title: 'OTHER', color: category4),
  null,
];

final mockTodoList = <Todo>[
  Todo(
    id: '0',
    title: 'Create Home Page',
    details: 'design process',
    isDone: true,
    category: mockCategories[1],
  ),
  Todo(
    id: '1',
    title: 'Create Drawer',
    details: 'design process',
    isDone: true,
    category: mockCategories[1],
  ),
  Todo(
    id: '2',
    title: 'Create Bottom Sheet',
    details: 'design process',
    isDone: false,
    category: mockCategories[1],
  ),
  Todo(
    id: '7',
    title: 'Create Splash Page',
    details: 'design process',
    isDone: false,
    category: mockCategories[1],
  ),
  Todo(
    id: '8',
    title: 'Create Login Page',
    details: 'design process',
    isDone: false,
    category: mockCategories[1],
  ),
  Todo(
    id: '3',
    title: 'Create About Page',
    details: 'design process',
    isDone: false,
    category: mockCategories[1],
  ),
  Todo(
    id: '4',
    title: 'Create Archives Page',
    details: 'design process',
    isDone: false,
    category: mockCategories[1],
  ),
  Todo(
    id: '5',
    title: 'Create Edit Categories Page',
    details: 'design process',
    isDone: false,
    category: mockCategories[1],
  ),
  Todo(
    id: '6',
    title: 'Create Todo BLoC',
    details: 'business logic of app',
    isDone: false,
    category: mockCategories[2],
  ),
];
