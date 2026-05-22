import { useEffect, useState } from 'react';
import { useAuthStore } from './authStore';

export function useHydrated() {
  const [isHydrated, setIsHydrated] = useState(false);

  useEffect(() => {
    // Wait for Zustand persist middleware to rehydrate data from localStorage
    const unsubHydrate = useAuthStore.persist.onHydrate(() => setIsHydrated(false));
    const unsubFinishHydration = useAuthStore.persist.onFinishHydration(() => setIsHydrated(true));

    // If it's already hydrated by the time we subscribe
    setIsHydrated(useAuthStore.persist.hasHydrated());

    return () => {
      unsubHydrate();
      unsubFinishHydration();
    };
  }, []);

  return isHydrated;
}
