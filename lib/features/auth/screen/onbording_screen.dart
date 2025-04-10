import 'package:template/core/constants/app_enums.dart';
import 'package:template/core/extention/build_extention.dart';
import 'package:template/core/widgets/back_navigation.dart';
import 'package:template/core/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _controller = PageController();
  int _currentPage = 0;
  final List<String?> _selectedAnswers = [null, null, null];

  final List<_OnboardingStep> _steps = const [
    _OnboardingStep(
      question: 'What draws you here most?',
      options: ['Seeking inner peace', 'Embracing adventure', 'Reconnecting to nature'],
    ),
    _OnboardingStep(
      question: 'Which path resonates deeply with your soul?',
      options: ['Growth and transformation', 'Solitude and reflection', 'Exploration and discovery'],
    ),
    _OnboardingStep(
      question: 'Nature whispers—what do you wish to hear?',
      options: ['Courage for new beginnings', 'Wisdom in stillness', "Guidance on life's journey"],
    ),
  ];

  void _nextPage() {
    if (_selectedAnswers[_currentPage] != null) {
      if (_currentPage < _steps.length - 1) {
        _controller.nextPage(duration: const Duration(milliseconds: 400), curve: Curves.easeInOut);
      } else {
        // Final screen logic
        debugPrint("All Done: $_selectedAnswers");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colorTheme.backgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            BackNavigation(
              title: 'Onboarding',
              startIcon: Icon(Icons.arrow_back, color: context.colorTheme.primaryColor),
              callback: () => _controller.previousPage(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
              ),
            ),
            const SizedBox(height: 16),
            _buildStepIndicator(),
            Expanded(
              child: PageView.builder(
                controller: _controller,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: _steps.length,
                onPageChanged: (i) => setState(() => _currentPage = i),
                itemBuilder: (context, index) {
                  final step = _steps[index];
                  return Padding(
                    padding: const EdgeInsets.all(24),
                    child: Column(
                      children: [
                        Text(
                          step.question,
                          textAlign: TextAlign.center,
                          style: context.textTheme.headlineSmall?.copyWith(
                            color: context.colorTheme.textColor,
                            fontWeight: FontWeight.w700,
                            fontSize: 20,
                          ),
                        ),
                        const SizedBox(height: 24),
                        ...step.options.map((option) {
                          return buildOptionTile(
                            value: option,
                            groupValue: _selectedAnswers[index] ?? "",
                            onChanged: (val) {
                              setState(() {
                                _selectedAnswers[index] = val!;
                              });
                            },
                          );
                        }),
                      ],
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(24),
              child: CustomButton(
                title: "Continue",
                buttonType: ButtonType.primary,
                color: context.colorTheme.primaryColor,
                fontColor: context.colorTheme.textColor,
                fontSize: 16,
                fontWeight: FontWeight.w700,
                minSize: Size(context.width, 54),
                onPressed: () {
                  if (_selectedAnswers[_currentPage] != null) {
                    _nextPage();
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStepIndicator() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(_steps.length * 2 - 1, (index) {
        if (index.isOdd) {
          // Connecting line
          return Container(
            width: 80,
            height: 3,
            color: context.colorTheme.borderColor,
          );
        } else {
          int stepIndex = index ~/ 2;
          bool isCompleted = _selectedAnswers[stepIndex] != null;
          bool isCurrent = stepIndex == _currentPage;
          Color bgColor;
          Widget child;

          if (isCompleted) {
            // Completed: redAccent + check
            bgColor = context.colorTheme.primaryColor;
            child = const Icon(Icons.check, color: Colors.white, size: 16);
          } else if (isCurrent) {
            // Current: redAccent + white border + white text
            bgColor = context.colorTheme.primaryColor;
            child = Text(
              "${stepIndex + 1}",
              style: TextStyle(
                color: context.colorTheme.textColor,
                fontWeight: FontWeight.bold,
              ),
            );
          } else if (stepIndex == 0) {
            // First circle with grey background
            bgColor = context.colorTheme.borderColor;
            child = Text(
              "${stepIndex + 1}",
              style: TextStyle(
                color: context.colorTheme.textColor,
                fontWeight: FontWeight.bold,
              ),
            );
          } else {
            // Future steps: transparent with faded text
            bgColor = context.colorTheme.borderColor;

            child = Text(
              "${stepIndex + 1}",
              style: TextStyle(
                color: context.colorTheme.textColor,
                fontWeight: FontWeight.bold,
              ),
            );
          }

          return Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: bgColor,
              border: isCurrent ? Border.all(color: Colors.white) : null,
              shape: BoxShape.circle,
            ),
            alignment: Alignment.center,
            child: child,
          );
        }
      }),
    );
  }

  Widget buildOptionTile({required String value, required String groupValue, required Function(String?) onChanged}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: InkWell(
        onTap: () => onChanged(value),
        borderRadius: BorderRadius.circular(12),
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: context.colorTheme.borderColor, width: 1),
            borderRadius: BorderRadius.circular(12),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 0),
          child: Row(
            children: [
              // Text first (start)
              Expanded(
                child: Text(
                  value,
                  style: context.textTheme.bodyMedium?.copyWith(
                    color: context.colorTheme.tertiaryColor,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),

              // Radio at the end (end)
              Radio<String>(
                value: value,
                groupValue: groupValue,
                onChanged: onChanged,
                activeColor: Colors.redAccent,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _OnboardingStep {
  final String question;
  final List<String> options;

  const _OnboardingStep({required this.question, required this.options});
}
