import 'package:flutter/material.dart';
import 'difficulty.dart';

class Task extends StatefulWidget {
  const Task(this.title, {super.key, required this.image, required this.difficulty});

  final String title;
  final String image;
  final int difficulty;

  @override
  State<Task> createState() => _TaskState();
}

class _TaskState extends State<Task> {
  int xp = 0;
  Color color = Colors.blue;
  int level = 1;

  int xpToNextLevel = 0;

  void setValue(){

  }

  void addXp(){
    if(xp >= xpToNextLevel){
      xp = 0;
      level += 1;
      xpToNextLevel *= 2;
      getLevelColor();
    }else{
      xp += 10;
    }
  }

  void manageLevel(){
    if(xpToNextLevel == 0){
      xpToNextLevel = widget.difficulty != 0 ? 10 * widget.difficulty : 10;
    }
  }

  void getLevelColor(){
    setState(() {
      switch(level){
        case 1:
          color = Colors.blue;
        case 2:
          color = Colors.blue.shade600;
        case 3:
          color = Colors.teal;
        case 4:
          color = Colors.amber.shade600;
        case 5:
          color = Colors.red;
        case 6:
          color = Colors.black;
      }
    });
  }

  @override
  void initState() {
    manageLevel();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              color: color,
            ),
            height: 140,
          ),
          Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: Colors.white,
                ),
                height: 100,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                      ),
                      height: 100,
                      width: 72,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(4),
                        child: Image.asset(
                          'assets/${widget.image}',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 200,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.title,
                            style: const TextStyle(fontSize: 18),
                            overflow: TextOverflow.ellipsis,
                          ),
                          Difficulty(difficultyLevel: widget.difficulty),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 52,
                      width: 52,
                      child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            addXp();
                            setValue();
                          });
                        },
                        child: const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.arrow_drop_up,
                            ),
                            Text(
                              'UP',
                              style: TextStyle(fontSize: 12),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 18),
                    width: 180,
                    child: LinearProgressIndicator(
                      backgroundColor: Colors.white.withOpacity(0.6),
                      value: xp / xpToNextLevel,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    'XP: ${xp.toInt()}/$xpToNextLevel',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    'Lvl: $level',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}


