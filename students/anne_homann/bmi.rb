# Body Mass Index (BMI) Calculator
# See http://www.consumer.gov/weightloss/bmi.htm

print "Enter you height (m): "
high = gets.to_f

print "Enter you weight (kgs): "
bulk = gets.to_f

yourbmi = "%.1f" % (bulk / (high * high))
print "Your BMI is #{yourbmi}\n"
