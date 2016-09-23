$(function() {
	$("#Answers").submit(function(e){
		e.preventDefault();

		var formTarget = $(this);
		var formContent = formTarget.serialize();
		var formAction = formTarget.attr("action");
		var formMethod = formTarget.attr("method");

		$.ajax({
			url: formAction,
			type: formMethod,
			data: formContent
		})
		.done(function(data) {
			console.log(data)
			var target = $("#answer-list");
			target.append(data);
			$("textarea[id='answer-text']").val("")
		});
	});
});

