PuppetLint.new_check(:no_cron_resources) do
  def check
    resource_indexes.each do |resource|
      next unless resource[:type].value == 'cron'

      notify :warning, {
        message: 'cron resources should not be used',
        line:    resource[:type].line,
        column:  resource[:type].column,
      }

    end
  end
end
