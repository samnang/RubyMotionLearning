class CrystalBall
  def initialize
    @predictions = load_predictions
  end

  def random_prediction
    @predictions.sample
  end

  private

  def load_predictions
    answer_file = NSBundle.mainBundle.pathForResource('predictions', ofType: 'json')
    data = NSData.alloc.initWithContentsOfFile(answer_file, options: NSDataReadingUncached)
    json = NSJSONSerialization.JSONObjectWithData(data, options: NSDataReadingUncached, error: nil)
    json["predictions"]
  end
end
