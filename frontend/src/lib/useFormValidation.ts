import { useEffect, useState } from 'react';
import type { RefObject } from 'react';

export function useFormValidation(formRef: RefObject<HTMLFormElement | HTMLDivElement | null>) {
  const [isValid, setIsValid] = useState(true);

  useEffect(() => {
    const container = formRef.current;
    if (!container) return;

    // We can only attach submit to form elements
    const form = container.tagName === 'FORM' ? container as HTMLFormElement : container.querySelector('form');
    if (!form) return;

    const handleInvalid = (e: Event) => {
      e.preventDefault(); // prevent default browser tooltip
      const target = e.target as HTMLElement;
      
      // Add error classes
      target.classList.add('!border-red-500', '!ring-red-200', 'bg-red-50');
    };

    const handleInput = (e: Event) => {
      const target = e.target as HTMLInputElement;
      if (target.checkValidity()) {
        // Remove error classes
        target.classList.remove('!border-red-500', '!ring-red-200', 'bg-red-50');
      }
    };

    const handleSubmit = (e: Event) => {
      if (!form.checkValidity()) {
        e.preventDefault();
        e.stopPropagation(); // prevent React synthetic event if it reaches here
        setIsValid(false);
        
        alert('Validation Error: Please fill in all required fields correctly.');
        
        // Focus first invalid element
        const firstInvalid = form.querySelector(':invalid') as HTMLElement;
        if (firstInvalid) {
          firstInvalid.focus();
        }
      } else {
        setIsValid(true);
      }
    };

    form.addEventListener('invalid', handleInvalid, true); // use capture to catch invalid events before they bubble
    form.addEventListener('input', handleInput, true);
    form.addEventListener('submit', handleSubmit); // Native submit listener

    return () => {
      form.removeEventListener('invalid', handleInvalid, true);
      form.removeEventListener('input', handleInput, true);
      form.removeEventListener('submit', handleSubmit);
    };
  }, [formRef]);

  return { isValid };
}
