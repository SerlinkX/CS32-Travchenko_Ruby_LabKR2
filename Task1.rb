require 'logger'

# Створюємо логгер для запису в файл
logger = Logger.new('system_time.log')

# Функція для перевірки часу
def check_system_time(logger)
  loop do
    current_time = Time.now
    logger.info("Поточний системний час: #{current_time}")
    puts "Поточний системний час: #{current_time}"  # Виведення в консоль
    sleep 60  # Затримка в 1 хвилину
  end
end

# Створюємо потік-демон
thread = Thread.new do
  check_system_time(logger)
end

# Налаштування потоку як демона
thread.abort_on_exception = true
thread.join if thread.status == 'run'
