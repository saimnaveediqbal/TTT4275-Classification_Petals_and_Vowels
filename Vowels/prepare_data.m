function [training_set, testing_set, vowel_code, talker_group_code, talker_number, vowel_classes] = prepare_data()
    vowdata = readtable("Dataset\vowdata_nohead.dat"); 
    timedata = readtable("Dataset\timedata.dat");
    filenames = char(vowdata.file);
    vowel_classes = str2mat('ae','ah','aw','eh','er','ei','ih','iy','oa','oo','uh','uw');
    talker_groups = str2mat('m','w','b','g');
    %calculate positions of talkers and vowels
    for i = 1:size(filenames)
        vowel_code(i) = strmatch(filenames(i, 4:5), vowel_classes);
        talker_group_code(i) = strmatch(filenames(i, 1), talker_groups);
        talker_number(i) = str2num(filenames(i, 2:3));
    end
    %seperate into training and testing
    training_set = [];
    for vowel = 1:size(vowel_classes)
        for talker = 1:size(talker_groups)
            talker_vowel_set = vowdata(talker_group_code==talker & vowel_code==vowel, :);
            training_length = round(size(talker_vowel_set,1)/2);
            training_set = [training_set; talker_vowel_set(1:training_length,:)];
        end
    end
    %recalculate positions of talkers and vowels
    filenames = char(training_set.file);
    vowel_code = []; talker_group_code = []; talker_number = [];
    for i = 1:size(training_set(:,1))
        vowel_code(i) = strmatch(filenames(i, 4:5), vowel_classes);
        talker_group_code(i) = strmatch(filenames(i, 1), talker_groups);
        talker_number(i) = str2num(filenames(i, 2:3));
    end
    vowel_code = vowel_code;
    testing_set = setdiff(vowdata, training_set, "stable");
end