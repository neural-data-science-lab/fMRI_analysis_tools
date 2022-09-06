% %---------------------%
% % Convert Onset Times %
% %---------------------%
% 
% % Converts timing files from BIDS format into a two-column format that can
% % be read by SPM
% 
% % The columns are:
% % 1. Onset (in seconds); and
% % 2. Duration (in seconds
% 
% 
% % Run this script from the directory that contains all of your subjects
% % (i.e., the Flanker directory)

subjects = [22 28 30 39 72 73 74 108 118 120 132 141 143 153 156 171 194 209 216 217]; % Replace with a list of all of the subjects you wish to analyze


for subject=subjects
    
    subject = num2str(subject, '%03d'); % Zero-pads each number so that the subject ID is 2 characters long

    cd(['sub-' subject '/func']) % Navigate to the subject's directory

    onsetTimes = tdfread('task-passivelistening_events.tsv', '\t'); % Read onset times file
    onsetTimes.trial_type = string(onsetTimes.trial_type); % Convert char array to string array, to make logical comparisons easier

    vocal = [];
    nonvocal = [];

    for i = 1:length(onsetTimes.onset)
        if strtrim(onsetTimes.trial_type(i,:)) == 'vocal'
            vocal = [vocal; onsetTimes.onset(i,:) onsetTimes.duration(i,:)];
        elseif strtrim(onsetTimes.trial_type(i,:)) == 'nonvocal'
            nonvocal = [nonvocal; onsetTimes.onset(i,:) onsetTimes.duration(i,:)];
        end
    end


    % Save timing files into text files

    save('vocal.txt', 'vocal', '-ASCII');
    save('nonvocal.txt', 'nonvocal', '-ASCII')

    % Go back to Flanker directory

    cd ../..

end
