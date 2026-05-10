import '../post_model.dart';

final List<PostModel> posts = [
  PostModel(
    id: '0',
    userId: 'user_0',
    userName: 'mariaaah',
    userImage: 'https://i.pravatar.cc/150?img=11',
    content:
        "Today I managed to get out of bed even though all I wanted to do was sleep. Sometimes, that's progress too. 😂",
    createdAt: DateTime.now().subtract(const Duration(minutes: 12)),
    loveCount: 15,
    commentsCount: 5,
    sharesCount: 1,
    isLikedByCurrentUser: false,
    imageUrls: [],
  ),
  PostModel(
    id: '1',
    userId: 'user_1',
    userName: 'calm.with.andrei',
    userImage: 'https://i.pravatar.cc/150?img=12',
    content:
        "Reminder: 2 minutes of deep breathing can change your entire day. Try it now. Close your eyes. Inhale. Exhale.",
    createdAt: DateTime.now().subtract(const Duration(hours: 3)),
    loveCount: 154,
    commentsCount: 33,
    sharesCount: 15,
    isLikedByCurrentUser: true,
    imageUrls: ['https://picsum.photos/600/400?image=1025'],
  ),
  PostModel(
    id: '2',
    userId: 'user_2',
    userName: 'biancadinu',
    userImage: 'https://i.pravatar.cc/150?img=13',
    content:
        "When I started drinking water regularly and getting 7 hours of sleep, my anxiety completely changed. Your body needs you.",
    createdAt: DateTime.now().subtract(const Duration(hours: 1)),
    loveCount: 13,
    commentsCount: 8,
    sharesCount: 0,
    isLikedByCurrentUser: false,
    imageUrls: [],
  ),
  PostModel(
    id: '3',
    userId: 'user_3',
    userName: 'rox.in.progress',
    userImage: 'https://i.pravatar.cc/150?img=14',
    content:
        "What are your evening rituals? I listen to a guided meditation and write down 3 things I'm grateful for. 📝✨",
    createdAt: DateTime.now().subtract(const Duration(hours: 6)),
    loveCount: 76,
    commentsCount: 21,
    sharesCount: 4,
    isLikedByCurrentUser: false,
    imageUrls: [
      'https://picsum.photos/600/400?image=1015',
      'https://picsum.photos/600/400?image=1016',
    ],
  ),
];
