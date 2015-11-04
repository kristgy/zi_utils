function settings = read_zi_settings(file)

fid = fopen(file,'r');
settings_f = textscan(fid,'%s\t%s','Headerlines',1);
fclose(fid);

settings = struct();
for line = 1:length(settings_f{1})
	strs = regexp(settings_f{1}{line}, '/', 'split');
	set_num = str2double(strrep(settings_f{2}{line},',','.'));

	switch length(strs)
	case 4
		settings.(lower(strs{1})).(['n_' lower(strs{2})]).(lower(strs{3})).(['n_' lower(strs{4})]) = set_num;
	case 3
		settings.(lower(strs{1})).(['n_' lower(strs{2})]).(lower(strs{3})) = set_num;
	case 2
		settings.(lower(strs{1})).(lower(strs{2})) = set_num;
	case 1
		settings.(lower(strs{1})) = set_num;
	end
end
