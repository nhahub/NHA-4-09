import '../post_model.dart';

final List<PostModel> posts = [
  PostModel(
    id: '0',
    userName: 'mariaaah',
    userAvatar: 'https://i.pravatar.cc/150?img=11',
    content:
        "Today I managed to get out of bed even though all I wanted to do was sleep. Sometimes, that's progress too. 😂",
    createdAt: DateTime.now().subtract(const Duration(minutes: 12)),
    likes: 15,
    comments: 5,
    sharesCount: 1,
    isPremium: false,
    isLiked: false,
    images: [],
  ),
  PostModel(
    id: '1',
    userName: 'calm.with.andrei',
    userAvatar: 'https://i.pravatar.cc/150?img=12',
    content:
        "Reminder: 2 minutes of deep breathing can change your entire day. Try it now. Close your eyes. Inhale. Exhale.",
    createdAt: DateTime.now().subtract(const Duration(hours: 3)),
    likes: 154,
    comments: 33,
    sharesCount: 15,
    isPremium: true,
    isLiked: true,
    images: ['https://picsum.photos/600/400?image=1025'],
  ),
  PostModel(
    id: '2',
    userName: 'biancadinu',
    userAvatar: 'https://i.pravatar.cc/150?img=13',
    content:
        "When I started drinking water regularly and getting 7 hours of sleep, my anxiety completely changed. Your body needs you.",
    createdAt: DateTime.now().subtract(const Duration(hours: 1)),
    likes: 13,
    comments: 8,
    sharesCount: 0,
    isPremium: true,
    isLiked: false,
    images: [],
  ),
  PostModel(
    id: '3',
    userName: 'rox.in.progress',
    userAvatar: 'https://i.pravatar.cc/150?img=14',
    content:
        "What are your evening rituals? I listen to a guided meditation and write down 3 things I'm grateful for. 📝✨",
    createdAt: DateTime.now().subtract(const Duration(hours: 6)),
    likes: 76,
    comments: 21,
    sharesCount: 4,
    isPremium: false,
    isLiked: false,
    images: [
      'https://picsum.photos/600/400?image=1015',
      'https://picsum.photos/600/400?image=1016',
    ],
  ),
];
