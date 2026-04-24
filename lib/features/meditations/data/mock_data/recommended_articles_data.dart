import '../../../../core/theming/app_assets.dart';
import '../models/article_model.dart';

List<ArticleModel> recommendedArticlesData = [
  ArticleModel(
    id: "1",
    title: "Anxiety: What you need to know",
    content: article1Content,
    authorName: "Andrei Neagoie",
    authorImage: AppAssets.avatar1,
    articleImage: AppAssets.newArrival1,
    category: "Anxiety",
    publishedAt: DateTime.now().toString(),
  ),
  ArticleModel(
    id: "2",
    title: "Anxiety: What you need to know",
    content: article1Content,
    authorName: "David Johnson",
    authorImage: AppAssets.avatar2,
    articleImage: AppAssets.newArrival2,
    category: "Anxiety",
    publishedAt: DateTime.now().toString(),
  ),
  ArticleModel(
    id: "3",
    title: "Anxiety: What you need to know",
    content: article1Content,
    authorName: "Sarah Evans",
    authorImage: AppAssets.avatar3,
    articleImage: AppAssets.newArrival3,
    category: "Anxiety",
    publishedAt: DateTime.now().toString(),
  ),
  ArticleModel(
    id: "4",
    title: "Anxiety: What you need to know",
    content: article1Content,
    authorName: "Brandon Smith",
    authorImage: AppAssets.avatar4,
    articleImage: AppAssets.newArrival4,
    category: "Anxiety",
    publishedAt: DateTime.now().toString(),
  ),
];

const String article1Content = '''
## Stressful or traumatic events and family history could increase your risk.

Anxiety is a natural part of life, and most of us experience it at some point. You might feel nervous, jittery, or on edge before taking a test, crossing a busy street, or making an important life decision. If you experience anxiety without a reason or more often or severely than expected, it may signal an anxiety disorder.

## What is anxiety?

Anxiety triggers the body’s fight or flight response: your heart beats faster, more blood flows to the muscles, your breathing becomes heavier, and your muscles tense up. These changes prepare us to respond quickly to threats. But for people with an anxiety disorder, these feelings can become overwhelming and interfere with everyday life.

Anxiety disorders are the most common form of mental illness in the United States. They can affect people of all ages, backgrounds, and walks of life. Common types include generalized anxiety disorder, social anxiety disorder, panic disorder, and specific phobias.

## Who is at risk?

Anyone can develop an anxiety disorder, but some risk factors make developing one more likely. These include:

- Family history of anxiety disorders or mental illness  
- Experiencing traumatic or stressful events  
- Underlying medical conditions  

## What are the symptoms?

Everyone feels anxiety differently. Some common symptoms include:

- **Physical symptoms** such as increased heart rate, rapid breathing, dizziness, shortness of breath, and headaches  
- **Cognitive and emotional symptoms** such as irritability, difficulty concentrating, and feeling restless, worried, or unable to sit still  
- **Changes in behavior** such as avoiding places, situations, and everyday activities that trigger anxiety or taking extreme steps to reduce or eliminate what is causing the anxiety  

## How are anxiety disorders diagnosed?

Your health care provider will ask you questions about your symptoms and medical history. They may also do a physical examination and run tests to rule out any medical conditions that could be causing your anxiety. If necessary, they can refer you to a mental health specialist such as a psychologist, psychiatrist, or therapist.

## How are anxiety disorders treated?

The good news is that anxiety is treatable. Different strategies to help manage your anxiety may involve psychotherapy, medication, or both.

### Psychotherapy methods:

- **Cognitive behavioral therapy (CBT)**  
- **Exposure therapy**  
- **Acceptance and commitment therapy**  

### Medications:

- **Anti-anxiety medications**  
- **Antidepressants**  
- **Beta blockers**  

### Lifestyle strategies:

- Exercise  
- Relaxation techniques (deep breathing or meditation)  
- Limiting caffeine and alcohol  
- Getting enough sleep  

A strong social support system is also important, whether it's through talking to friends and family or joining a support group.

## Getting help

Remember, feeling anxious sometimes is normal. But if your symptoms last a long time, get worse, or interfere with your day-to-day life, it may be a sign of an anxiety disorder. If you or someone you know is experiencing symptoms of anxiety disorders, reach out to a health care provider. Help is available, and you don't have to face your anxiety alone.''';
