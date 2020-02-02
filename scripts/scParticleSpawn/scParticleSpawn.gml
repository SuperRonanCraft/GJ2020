///@arg x-min
///@arg x-max
///@arg y-min
///@arg y-max
///@arg particle
///@arg amount
var _xl = argument[0];
var _xr = argument[1];
var _yl = argument[2];
var _yr = argument[3];
var _part = argument[4];
var _amt = argument[5];

part_emitter_region(global.ParticleSystem1,global.Emitter1,_xl, _xr, _yl, _yr, ps_shape_ellipse, ps_distr_gaussian);
part_emitter_burst(global.ParticleSystem1,global.Emitter1, _part, _amt);