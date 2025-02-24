declare class Spring {
	public Target: Vector3;
	public Velocity: Vector3;
	public Position: Vector3;

	public Mass: number;
	public Force: number;
	public Damping: number;
	public Speed: number;

	public constructor(mass?: number, force?: number, damping?: number, speed?: number);

	public GetStats(): LuaTuple<[number, number, number, number]>;
	public ChangeStats(mass?: number, force?: number, damping?: number, speed?: number): void;
	public Shove(force: Vector3): Vector3;
	public Update(deltaTime: number): Vector3;
}

export = Spring;
