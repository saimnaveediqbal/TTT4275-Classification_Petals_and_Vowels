vowdata = readtable("Dataset\vowdata_nohead.dat"); % so, no head?
timedata = readtable("Dataset\timedata.dat");
filenames = char(vowdata.file);
vowel = str2mat('ae','ah','aw','eh','er','ei','ih','iy','oa','oo','uh','uw');
talker_group = str2mat('m','w','b','g');
for i = 1:size(filenames)
    vowel_code(i) = strmatch(filenames(i, 4:5), vowel);
    talker_group_code(i) = strmatch(filenames(i, 1), talker_group);
    talker_number(i) = str2num(filenames(i, 2:3));
end