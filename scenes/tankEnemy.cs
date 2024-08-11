using Godot;
using System;
using System.Timers;

public partial class tankEnemy : CharacterBody2D
{
	string direction;
	
	public override void _Ready()
	{
		direction = "r";
		
	}

    public override void _PhysicsProcess(double delta)
    {
		Vector2 Pos = Position;

		
		
		//TODO: for any modders please give me a fix because this reduces like 324i320-4923-0492340-9324092340923493043249034932-049320-49204932-049% of the performance
		if (GetNode<RayCast2D>("RayCast2D").IsColliding()) {
			if (direction == "r") {
				Pos.X -= 1;
			}
			if (direction == "l") {
				Pos.X += 1;
			}

		}
		
		Position = Pos;


        base._PhysicsProcess(delta);
    }

    

	public override void _Process(double delta)
	{
		//          ^^^^^
		//damn they were really literal with "void"
		GD.Print(direction);

		if (GetNode<RayCast2D>("Raycast2D3").IsColliding())
		{
			direction = "l"; //i don't know what's wrong with this :(
		}
		
		else if (GetNode<RayCast2D>("RayCast2D2").IsColliding())
		{
		direction = "r";
		}

	}
}
