1;

input_raw = fileread("input.txt");
input_rows = strsplit(input_raw, "\n"); % Split input string by each newline
input_cols = cellfun(@(x) num2cell(char(x)), input_rows, 'UniformOutput', false); % split each row of strings into cells of chars
input = vertcat(input_cols{:}); % Flatten
input = cellfun(@str2num, input, 'UniformOutput', false); % Convert all (character) elements to numbers
input = cell2mat(input); % Convert to matrix

freq = mode(input); % Calculate most frequenct value in each column
str = num2str(freq); % Create string of all most frequent values

gamma = bin2dec(str)
epsilon = bitcmp(gamma, length(freq))
dec2bin(gamma)
dec2bin(epsilon)

power_consumption = gamma * epsilon

