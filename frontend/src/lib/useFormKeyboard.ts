import { useEffect } from 'react';
import type { RefObject } from 'react';

interface UseFormKeyboardOptions {
  autoFocus?: boolean;
}

export function useFormKeyboard(
  formRef: RefObject<HTMLFormElement | HTMLDivElement | null>,
  options: UseFormKeyboardOptions = { autoFocus: true }
) {
  useEffect(() => {
    const container = formRef.current;
    if (!container) return;

    const focusableSelector = 'input:not([disabled]):not([type="hidden"]), select:not([disabled]), textarea:not([disabled]), button:not([disabled])';

    // Auto focus first element
    if (options.autoFocus) {
      const firstElement = container.querySelector<HTMLElement>(focusableSelector);
      if (firstElement) {
        // slight delay to ensure it renders completely (especially in modals)
        setTimeout(() => firstElement.focus(), 50);
      }
    }

    const handleKeyDown = (e: KeyboardEvent) => {
      if (e.key === 'Enter') {
        const target = e.target as HTMLElement;
        
        // Let submit buttons work normally
        if (target.tagName === 'BUTTON' && (target as HTMLButtonElement).type === 'submit') {
          return;
        }

        // Let textareas use Enter for new lines
        if (target.tagName === 'TEXTAREA') {
          return;
        }

        e.preventDefault();
        
        const elements = Array.from(container.querySelectorAll<HTMLElement>(focusableSelector))
                              .filter(el => !el.hasAttribute('disabled') && el.tabIndex !== -1);
        
        const currentIndex = elements.indexOf(target);
        if (currentIndex > -1 && currentIndex < elements.length - 1) {
          elements[currentIndex + 1].focus();
        }
      }
    };

    container.addEventListener('keydown', handleKeyDown as EventListener);
    return () => {
      container.removeEventListener('keydown', handleKeyDown as EventListener);
    };
  }, [formRef, options.autoFocus]);
}
