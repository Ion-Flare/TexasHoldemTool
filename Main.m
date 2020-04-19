% Texas Holdem assistant
% Ian Hudis 
% 4/18/20
clear all;
%rng(1113732);

trials=1000;

% for card: 1 => ace, 11 => Jack, 12 => queen, 13 =>king 
%for suit : 1 => clubs, 2 => hearts, 3 => clovers, 4 => diamonds 
hand = [3,2; 
        11,3]; %% (card,suit) 

cardsFlipped = [0,0;
                0,0;
                0,0;
                0,0;
                0,0];  % 0 means unknown 
            
CardsFlippedReset=cardsFlipped;

            
HighCard=0;
Pair=0;
TwoPair=0;
ThreeofAKind=0;
Straight=0;            
Flush=0;
StraightFlush=0;
RoyalFlush=0;


  CardsUnknown = 0; % at least 45 cards will be unknown
            
for n=1:trials
    
   cardsFlipped = CardsFlippedReset; %resets random values added in previous trial
    
    % factor in cards that haven't been flipped yet.
   for check = 1:5  
       
      if (cardsFlipped(check,1) == 0)
      %find how many known and unknown cards there are.
      CardsUnknown=CardsUnknown+1;
   
      
      %give the unknown cards flipped a random value
      
      CardFlipped = [randperm(13,1),randperm(4,1)]; 
      
      %Make sure the card flipped isnt alread in the hand or previously flipped
  while(1)
      
          if CardFlipped == hand(1,1:2) % 1st card in hand 
               CardFlipped = [randperm(13,1),randperm(4,1)];  %change hand
          else if CardFlipped == hand(2,1:2) % 2nd card in hand 
               CardFlipped = [randperm(13,1),randperm(4,1)];  %change hand
          else if CardFlipped == cardsFlipped(1,1:2) % 1st card flipped already has the same combo
          CardFlipped = [randperm(13,1),randperm(4,1)];  %change hand
          else if CardFlipped == cardsFlipped(2,1:2) % 2nd card flipped already has the same combo
          CardFlipped = [randperm(13,1),randperm(4,1)];  %change hand
          else if CardFlipped == cardsFlipped(3,1:2) % 3rd card flipped already has the same combo
          CardFlipped = [randperm(13,1),randperm(4,1)];  %change hand
          else if CardFlipped == cardsFlipped(4,1:2) % 4th card flipped already has the same combo
          CardFlipped = [randperm(13,1),randperm(4,1)];  %change hand
              
              else
                break; %cards do not match any in hand
              end
              end
            end
              end
              end
          end
  end
      
      cardsFlipped(check,1:2)=  CardFlipped; %places cards flipped into array
      
      end
      
   end
  
 % Combine the cards in hand with cards flipped
   CardsAvailable = [hand; cardsFlipped];
    
   
   %check for pairs
   P=0; 
   for j=1:7
   
   for i=1:7
       if(CardsAvailable(j,1)==CardsAvailable(i,1) && i~=j)
       P=P+1;
       break;
       end
   end
   end
 
   if P>0 %one pair
      Pair=Pair+1;
   end
     
   if P>2 %two pair
      TwoPair=TwoPair+1;
   end
  
      
   
%check for 3 of a kind
   P=0; 
   for j=1:7
   P3=0;
   for i=1:7
       
       if(CardsAvailable(j,1)==CardsAvailable(i,1) && i~=j)
       P=P+1;
       end
       
       if(CardsAvailable(j,1)==CardsAvailable(i,1) && i~=j && P>0)
       P3=P3+1;
       break;
       end
      
   end
   
   end
 
    if P3>0 %one pair
      ThreeofAKind=ThreeofAKind+1;
    end
   
    
  % Check for a straight
  
  
  %check for flush
  
  % check full house
  
  %check for 4 of a kind
  
  % straight flush
  
  %royal flush
     
  
end


     Pair
     Prob_pair=Pair/trials
     
     TwoPair
     Prob_TwoPair=TwoPair/trials
     
     ThreeofAKind
     Prob_ThreeKind=ThreeofAKind/trials
