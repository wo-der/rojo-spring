declare class Spring<M extends number, F extends number, D extends number, S extends number> {
	public Target: Vector3;
	public Velocity: Vector3;
	public Position: Vector3;

	public Mass: M;
	public Force: F;
	public Damping: D;
	public Speed: S;

	public constructor(mass?: M, force?: F, damping?: D, speed?: S);

	public GetStats(): LuaTuple<[M, F, D, S]>;
	public ChangeStats(mass?: number, force?: number, damping?: number, speed?: number): void;
	public Shove(force: Vector3): Vector3;
	public Update(deltaTime: number): Vector3;
}

export = Spring;
