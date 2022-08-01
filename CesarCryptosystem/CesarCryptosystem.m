


function console_output = caesarChipher()

    alphabet =['a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z'];
    
    clear_text = input('Enter a text (plaintext) that you wish to encrypt it (eliminate the spaces): ','s');
    
    key= input('Enter the key: ');
    
    %key normalization
    if key > 26 || key <0
        key = mod(key,6);
    end
    
    breaking_loop = 0 ;
    iteration_flag = 1 ;
    
    while iteration_flag <= length(clear_text)
        if ismember(clear_text(iteration_flag),'A':'B') == 1
            breaking_loop = 1;
            console_output = exception_message ;
        elseif isletter(clear_text(iteration_flag)) == 1
            y = strfind(alphabet , clear_text(iteration_flag));
            z = y + key;
            if z > 26
                z = z - 26 ;
            end
            console_output(iteration_flag)=(alphabet(z));
        elseif isletter(clear_text(iteration_flag)) == 0
            if plain(integration_flag) == ' '
                console_output(iteration_flag) = clear_text(integratio_flag);
            else
                breaking_loop = 1 ;
                console_output = exception_message;
            end
        end
        iteration_flag = iteration_flag +1;
        if breaking_loop == 1
            break
        end
    end
    
    
    % output display
    display(console_output);
    
    X = ['The plaintext entropy is ', num2str(ComputeEntropy(console_output))];
    disp(X)
    
    X = ['The cyphertext entropy is ', num2str(ComputeEntropy(clear_text))];
    disp(X)

     

end



%% Computation Entropy function

function H = ComputeEntropy(s)
    if (ischar(s)==1)    % Checks whether s is a character array
        l=length(s);
        uniqueChars = unique(s);   % String s has all unique characters sorted
        lenChar=length(uniqueChars);

        % relative frequence for each characters
        f=zeros(1,lenChar);
        for i=1:lenChar
            f(i)=length(strfind(s,uniqueChars(i)));  % Count the occurence of unique characters
        end

        %  Probabilities for each unique character
        p=zeros(1,lenChar);
        for i=1:lenChar
            p(i)=f(i)/l;       
        end
    
        %Entropy computation
        H=0;
        for  i=1:lenChar
            H = H + (-p(i)* (log2(p(i))/log2(26)) );  % Calculating the Entropy in base 26
        end
    else
        display('Invalid String');
    end
    display(H)
    histogram(f)
end




%% Conditional Entropy
function H = ConditionalEntropy(Y,X)
    % Axiom of information theory
    H = ComputeEntropy(Y) - MutualInformation(X,Y);

end
