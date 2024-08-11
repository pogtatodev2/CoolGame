using Godot;
using System;
using System.CodeDom.Compiler;
using System.Reflection.Metadata;



public partial class jank : CharacterBody2D
{



	
	//  VARIABLES:
	bool LaserOn = false;
	int gravity = 20;
	int xVelocity;
	int yVelocity;

	char dir = 'r';

	

	public override void _Ready()
	{
			GetNode<Timer>("BeamTmer").Timeout += () => GD.Print("kablaam");
	}

	

	// what is happening
	public override void _Process(double delta)
	{
		//  LASER
		
		

		if (LaserOn == true)
		{
			GetNode<ColorRect>("Beam").Visible = true;
		}
		
	}

	public override void _PhysicsProcess(double delta)
	{

		

		//  MOVEMENT:
		Velocity = new Vector2(xVelocity, yVelocity);
		if (!IsOnFloor())
		{
			yVelocity += gravity;
		}
		if (GetNode<RayCast2D>("LeftDownRayCast").IsColliding() || GetNode<RayCast2D>("LeftUpRayCast2").IsColliding())
		{
			dir = 'l';
		}
	
		else if (GetNode<RayCast2D>("RightDownRaycast").IsColliding() || GetNode<RayCast2D>("RightUpRaycast2").IsColliding())
		{
			dir = 'r';
		}
		if (dir == 'l')
		{
			xVelocity = 60;
		}
		else if (dir == 'r')
		{
			xVelocity = -60;
		}
		if (GetParent().GetNode<CharacterBody2D>("PlayerChar").Position.X > Position.X)
		{
			GetNode<Sprite2D>("Sprite2D").FlipH = true;
		}
		if (GetParent().GetNode<CharacterBody2D>("PlayerChar").Position.X < Position.X)
		{
			GetNode<Sprite2D>("Sprite2D").FlipH = false;
		}





		MoveAndSlide();

		
		base._PhysicsProcess(delta);
	}







		private void OnArea2DEntered(Area2D area)
	{
		GD.Print("baa");
	}

}
