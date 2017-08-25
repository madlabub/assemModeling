function [vertex,faces,normal] = read_obj(filename)

obj = readObj(filename);
vertex = obj.v';
faces = obj.f.v';
normal = obj.vn';