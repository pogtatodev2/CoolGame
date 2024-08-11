using Godot;
using System;

public partial class enemy_base : CharacterBody2D
{
	public override void _Ready()
	{
		if (GetNode<RayCast2D>("RayCast2D").IsColliding()) {
			GD.Print("tee hee");
		}
	}

	public override void _Process(double delta)
	{
	}
}
