require 'classifier'

quotebot = Classifier::Bayes.new 'Alan Turing', 'Mitch Hedberg'

# Train your classifier using as many quotes as possible...
quotebot.train_alan_turing(%{
  It seems probable that once the machine thinking method had started, it
  would not take long to outstrip our feeble powers. They would be able to
  converse with each other to sharpen their wits. At some stage therefore,
  we should have to expect the machines to take control.})
quotebot.train_alan_turing(%{
  A computer would deserve to be called intelligent if it could deceive a
  human into believing that it was human})
quotebot.train_alan_turing(%{
  I believe that at the end of the century the use of words and general
  educated opinion will have altered so much that one will be able to speak
  of machines thinking without expecting to be contradicted.})

quotebot.train_mitch_hedberg(%{
  The depressing thing about tennis is that no matter how good I get,
  I'll never be as good as a wall.})
quotebot.train_mitch_hedberg(%{
  I want to get a vending machine, with fun sized candy bars, and the glass
  in front is a magnifying glass. You'll be mad, but it will be too late.})
quotebot.train_mitch_hedberg(%{
  I like escalators, because an escalator can never break; it can only become
  stairs. There would never be an “Escalator Temporarily Out of Order” sign.
  Only an "Escalator Temporarily Stairs… Sorry for the Convenience."})

quoter1 = quotebot.classify %{
  May not machines carry out something which ought to be described as thinking
  but which is very different from what a man does?}
quoter2 = quotebot.classify %{
  My friend asked me if I wanted a frozen banana, but I said
  "No… but I want a regular banana later, so yeah."}

puts "#{quoter1} said this quote."
puts "#{quoter2} said this quote."
