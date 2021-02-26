import 'package:flutter/material.dart';

class Articles {
  final int id;
  final String title;
  final String description;
  final String introduction;
  final String body;
  final String articleDate;
  final String authorName;
  final image;

  Articles(
      {@required this.id,
      @required this.title,
      @required this.description,
      @required this.introduction,
      @required this.body,
      @required this.articleDate,
      @required this.authorName,
      this.image});
}

List<Articles> demoArticles = [
  Articles(
      id: 1,
      title: 'Asymptomatic COVID-19',
      description:
          'COVID-19 is a respiratory disease caused by severe acute respiratory syndrome coronavirus 2 (SARS-CoV-2). Whilst the majority of COVID-19 cases are mild or moderate, a small proportion are severe and can lead to difficulties with breathing and pneumonia. Understanding what SARS-CoV-2 does to lung cells will enable better treatments for severe COVID-19.',
      introduction:
          'A large proportion of healthy individuals (as many as around 40% or more) who test positive for COVID-19 do not exhibit any noticeable symptoms, however, are still able to transmit the disease. It is thought that the vast majority of asymptomatic patients are younger. Whilst asymptomatic individuals who test positive for COVID-19 may not overtly show any signs of lung damage, new evidence suggests that there may be some subtle changes that occur in such patients, potentially predisposing asymptomatic patients for future health issues and complications in later life.',
      body: 'Case studies from recovered asymptomatic COVID-19 patients have shown lung abnormalities using CT scans. For example, take the case of the Diamond Princess cruise ship, where there was an infamous outbreak of COVID-19 at the beginning of the pandemic in February 2020.' +
          '73% of positive COVID-19 cases on board the Diamond Princess cruise ship were asymptomatic, of which 54% showed lung opacities (ground-glass opacities; GGO) which reflects the filling of the air spaces in the lungs with fluid relating to edema, fibrosis (scarring) and inflammation in the lungs.'
              'However, it is important to note that whilst a majority of patients on board the Diamond Princess cruise ship were asymptomatic, the overall age of the group was older, thus there may be age-dependent effects that occur, which may not occur to such an extent in younger individuals.',
      articleDate: '26 February 2021',
      authorName: 'Urusha')
];
