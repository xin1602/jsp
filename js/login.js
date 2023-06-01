const container = document.querySelector('.container');

const buttons = document.querySelectorAll('[id *= "-toggle"]');

buttons.forEach((btn)=>{
	btn.addEventListener('click',function(event){
		event.preventDefault();
		container.classList.toggle('flipped');
	});
});
