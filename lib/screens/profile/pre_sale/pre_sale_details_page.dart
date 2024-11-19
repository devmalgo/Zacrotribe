import 'package:flutter/material.dart';
import 'package:zacro_tribe/widgets/doughnut_chart.dart';

class PreSaleDetailsPage extends StatelessWidget {
  const PreSaleDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEFE8FF),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Title Section
            const Center(
              child: Column(
                children: [
                  Text(
                    'PIXEL PIX',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 10),
                ],
              ),
            ),

            // Overview Section
            const SectionTitle(title: "OVERVIEW"),
            const SectionContent(
              content:
              "Pixel Pix is an innovative blockchain-based gaming project that brings a unique blend of nostalgia and cutting-edge technology. Our goal is to create a vibrant gaming metaverse where players can experience the charm of pixel art combined with the limitless possibilities of blockchain.",
            ),

            // Key Features Section
            const SectionTitle(title: "KEY FEATURES"),
            const FeatureList(features: [
              "Pixel Art Universe: Immerse yourself in a captivating pixelated world, where every detail is a work of art.",
              "Play-to-Earn: Earn valuable in-game assets by participating in the Pixel Pix ecosystem. Your skills and achievements are truly rewarded.",
              "Decentralized Ownership: Enjoy true ownership of your in-game assets through blockchain technology. Trade, sell, or showcase your rare items with ease.",
            ]),

            // Tokenomics Section
            const SectionTitle(title: "TOKENOMICS"),
            DoughnutChart(),
            const SectionContent(
              content: '''
Token Symbol: PPIX
Total Supply: 1,000,000,000 PPIX
Use Cases: In-game purchases, governance, staking, and more.
Lock-up: 25% unlocked on TGE, 4 months cliff, then 5% on a monthly basis
Distribution: Details available in the Pixel Pix Whitepaper
              ''',
            ),

            // Roadmap Section
            const SectionTitle(title: "ROADMAP"),
            const SectionContent(
              content: '''
We’re excited about the future of IGO and the journey ahead. Our roadmap outlines the key milestones and developments we have planned to bring our vision to life.

PHASE 1: CONCEPTUALIZATION AND DEVELOPMENT (Q1 2024 - Q2 2024)
- Conceptualization: Brainstorming and ideation to define the core concept of IGO.
- Team Formation: Assembling a dedicated team of developers, designers, and blockchain experts.
- Market Research: Analyzing the gaming and blockchain market to identify opportunities and challenges.

PHASE 2: WHITEPAPER RELEASE AND COMMUNITY BUILDING (Q3 2024)
- Whitepaper Release: Publishing the detailed Pixel Pix whitepaper outlining the project’s vision, features, tokenomics, and more.
- Community Building: Initiating community engagement on social media platforms and establishing communication channels.
- Feedback Gathering: Gathering valuable feedback from the community to refine and improve the project.
              ''',
            ),

            // Registration Section
            const SizedBox(height: 20),
            AirdropCard(
              projectName: 'PIXEL PIX',
              totalRaise: '85K',
              valuation: '1.5M',
              minAllocation: '0',
              progress: 0.6,
              symbolIcon: Icons.pie_chart, // Placeholder for Binance icon
              bgColor: Colors.purple.shade100,
              progressColor: Colors.purple,
            ),
          ],
        ),
      ),
    );
  }
}

class SectionTitle extends StatelessWidget {
  final String title;

  const SectionTitle({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
    );
  }
}

class SectionContent extends StatelessWidget {
  final String content;

  const SectionContent({Key? key, required this.content}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Text(
        content,
        style: const TextStyle(fontSize: 14, color: Colors.black87),
      ),
    );
  }
}

class FeatureList extends StatelessWidget {
  final List<String> features;

  const FeatureList({Key? key, required this.features}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: features
          .map(
            (feature) => Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Icon(Icons.circle, size: 8, color: Colors.blueAccent),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  feature,
                  style: const TextStyle(fontSize: 14, color: Colors.black87),
                ),
              ),
            ],
          ),
        ),
      )
          .toList(),
    );
  }
}

class AirdropCard extends StatelessWidget {
  final String projectName;
  final String totalRaise;
  final String valuation;
  final String minAllocation;
  final double progress;
  final IconData symbolIcon;
  final Color bgColor;
  final Color progressColor;

  const AirdropCard({
    required this.projectName,
    required this.totalRaise,
    required this.valuation,
    required this.minAllocation,
    required this.progress,
    required this.symbolIcon,
    required this.bgColor,
    required this.progressColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              SizedBox(width: 8),
              Expanded(
                child: Text(
                  projectName,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Icon(symbolIcon, size: 32),
            ],
          ),
          SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              buildInfoBadge('TOTAL RAISE $totalRaise'),
              buildInfoBadge('VALUE $valuation'),
              buildInfoBadge('MIN ALLO $minAllocation'),
            ],
          ),
          SizedBox(height: 16),
          LinearProgressIndicator(
            value: progress,
            backgroundColor: Colors.grey.shade300,
            color: progressColor,
            minHeight: 8,
          ),
          SizedBox(height: 8),
          Text(
            '0/100,069 MECHA',
            style: TextStyle(fontSize: 12),
          ),
          SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              OutlinedButton(
                onPressed: () {},
                child: const Text('CLAIM TOKEN'),
              ),
              Row(
                children: [
                  Icon(Icons.clear_sharp, size: 20),
                  SizedBox(width: 8),
                  Icon(Icons.telegram, size: 20),
                  SizedBox(width: 8),
                  Icon(Icons.discord, size: 20),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildInfoBadge(String text) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        text,
        style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
      ),
    );
  }
}
