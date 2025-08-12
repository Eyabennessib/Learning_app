import 'package:dummy_app/core/themes.dart';
import 'package:dummy_app/core/utils/truncate_text.dart';
import 'package:dummy_app/data/api/nmimes_microservice.dart';
import 'package:flutter/material.dart';

class WeeklyTaskList extends StatelessWidget {
  final List<Week> weeks;

  const WeeklyTaskList({super.key, required this.weeks});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(weeks.length, (weekIndex) {
        final week = weeks[weekIndex];
        final tasks = week.tasks;

        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                week.week,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 15),

              ...tasks.map((task) => Container(
                margin: const EdgeInsets.only(bottom: 8),
                padding: const EdgeInsets.all(16),
                width: MediaQuery.of(context).size.width,
                height: 70,
                decoration: BoxDecoration(
                  color: AppColors.mainLightColor,
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [

                    SizedBox(
                      // decoration: BoxDecoration(
                      //   border: Border.all(width: 2.0)
                      // ),
                      width: 200,
                      child: Text(
                        truncateText(task.task, 25) ,
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),



                    Image.asset(
                      task.done ? AppAssets.iconCheck : AppAssets.iconDash,

                    )
                    
                  ],
                ),
              )),
            ],
          ),
        );
      }),
    );
  }
}
